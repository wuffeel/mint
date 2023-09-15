import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:mint/backbone/notification_type.dart';
import 'package:mint/data/repository/abstract/notification_repository.dart';
import 'package:mint/utils/notification_to_short_string.dart';
import 'package:mint_core/mint_module.dart';

@LazySingleton(as: NotificationRepository)
class FirebaseNotificationRepository implements NotificationRepository {
  FirebaseNotificationRepository(this._firebaseInitializer);

  final FirebaseInitializer _firebaseInitializer;
  final _messagingInstance = FirebaseMessaging.instance;

  final _localNotifications = FlutterLocalNotificationsPlugin();
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  final _chatMessagesController = StreamController<String>.broadcast();
  final _bookingMessagesController = StreamController<String>.broadcast();

  static const _tokenCollection = 'fcmTokens';

  StreamSubscription<RemoteMessage>? _onMessageSubscription;
  StreamSubscription<RemoteMessage>? _onMessageOpenedAppSubscription;
  StreamSubscription<String>? _onTokenRefreshSubscription;

  Future<CollectionReference<Map<String, dynamic>>>
      get _tokenCollectionRef async {
    return (await _firebaseInitializer.firestore).collection(_tokenCollection);
  }

  /// Returns a Stream that is called when user taps on notification related to
  /// chat.
  ///
  /// The Stream contains roomId.
  @override
  Stream<String> get onChatRoomId => _chatMessagesController.stream;

  /// Returns a Stream that is called when user taps on notification related to
  /// consultation booked that is about to start.
  ///
  /// The Stream contains bookingId.
  @override
  Stream<String> get onBookingId => _bookingMessagesController.stream;

  @override
  Future<void> initializeNotifications(String userId) async {
    final settings = await _messagingInstance.requestPermission();
    if (settings.authorizationStatus.name == 'denied') return;

    final fcmToken = await _messagingInstance.getToken();
    if (fcmToken == null) return;
    log('fcmToken: $fcmToken');

    _subscribeToStreams();
    await _updateToken(fcmToken, userId);
    _listenTokenChange(userId);

    await _handleTerminatedNotification();
    await _initializeLocalNotifications();
  }

  /// Cancels all active stream subscriptions and closes the stream controllers
  /// for chat and booking messages.
  @override
  Future<void> closeSubscriptions() async {
    await _onMessageSubscription?.cancel();
    await _onMessageOpenedAppSubscription?.cancel();
    await _onTokenRefreshSubscription?.cancel();
  }

  /// Sets up a listener for token refresh events.
  void _listenTokenChange(String userId) {
    _onTokenRefreshSubscription =
        _messagingInstance.onTokenRefresh.listen((fcmToken) async {
      log('onTokenRefresh token: $fcmToken');
      await _setFcmToken((await _tokenCollectionRef).doc(userId), userId);
    })
          ..onError((Object error) {
            log('tokenRefreshError: $error');
          });
  }

  /// Subscribes to incoming message streams using FirebaseMessaging.
  ///
  /// Sets up listeners for both foreground and background messages,
  /// routed to their respective handlers.
  void _subscribeToStreams() {
    _onMessageSubscription = FirebaseMessaging.onMessage.listen(_handleMessage);
    _onMessageOpenedAppSubscription =
        FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
  }

  /// Handles incoming foreground messages for Android platform.
  ///
  /// See https://firebase.flutter.dev/docs/messaging/notifications/#foreground-notifications
  Future<void> _handleMessage(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;
    if (notification == null || android == null) return;

    log('onMessage: ${message.toMap()}');

    final imageUrl = notification.android?.imageUrl;
    String? base64Image;
    if (imageUrl != null) base64Image = await _base64encodedImage(imageUrl);

    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: android.smallIcon,
          largeIcon: base64Image != null
              ? ByteArrayAndroidBitmap.fromBase64String(base64Image)
              : null,
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      payload: jsonEncode(message.toMap()),
    );
  }

  /// Handles user navigation when a background notification is tapped.
  Future<void> _handleMessageOpenedApp(RemoteMessage message) async {
    log('onMessageOpenedApp: ${message.toMap()}');
    _handleNotificationBasedOnType(message);
  }

  /// Updates the FCM token for a user in the Firestore database.
  Future<void> _updateToken(String fcmToken, String userId) async {
    await _checkDifferentUser(fcmToken, userId);

    final tokenCollection = await _tokenCollectionRef;
    final tokenDoc = tokenCollection.doc(userId);
    final tokenSnap = await tokenDoc.get();
    final token = tokenSnap.data()?['token'];

    if (!tokenSnap.exists || (token != null && token != fcmToken)) {
      await _setFcmToken(tokenDoc, fcmToken);
    }
  }

  /// Checks and removes the association of an FCM [fcmToken] with a
  /// [userId] if document ID differs from [userId].
  ///
  /// This function verifies if the provided [fcmToken] is currently associated
  /// with any user. If the document ID of the token differs from [userId],
  /// it deletes the existing token association.
  Future<void> _checkDifferentUser(String fcmToken, String userId) async {
    final tokenCollection = await _tokenCollectionRef;
    final tokenSnap = await tokenCollection
        .where('token', isEqualTo: fcmToken)
        .limit(1)
        .get();
    if (tokenSnap.docs.isEmpty) {
      return;
    }
    final tokenDoc = tokenSnap.docs.first;
    if (tokenDoc.id == userId) return;
    await tokenCollection.doc(tokenDoc.id).delete();
  }

  /// Sets the FCM token in the Firestore database with the current timestamp.
  Future<void> _setFcmToken(DocumentReference tokenDoc, String fcmToken) {
    return tokenDoc.set({
      'token': fcmToken,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Handles terminated notifications.
  ///
  /// Retrieves the initial notification message that triggered the app's
  /// launch.
  Future<void> _handleTerminatedNotification() async {
    final terminatedMessage = await _messagingInstance.getInitialMessage();
    if (terminatedMessage != null) {
      _handleNotificationBasedOnType(terminatedMessage);
    }
  }

  /// Handles notifications by type.
  ///
  /// Processes incoming notifications based on their 'notificationType'
  /// field.
  /// If a matching notification type is found, the corresponding handler is
  /// invoked.
  void _handleNotificationBasedOnType(RemoteMessage message) {
    final notificationType = message.data['notificationType'] as String?;
    if (notificationType == null) return;
    NotificationType? type;

    for (final enumType in NotificationType.values) {
      if (enumType.toShortString() == notificationType) {
        type = enumType;
        break;
      }
    }

    if (type != null) {
      switch (type) {
        case NotificationType.chat:
          _handleChatNotification(message);
          break;
        case NotificationType.booking:
          _handleBookingNotification(message);
          break;
      }
    }
  }

  /// Handles chat notifications.
  ///
  /// Retrieves the 'roomId' from the [message] data and adds it to the chat
  /// stream for further processing.
  Future<void> _handleChatNotification(RemoteMessage message) async {
    final roomId = message.data['roomId'] as String?;
    if (roomId == null) return;
    _chatMessagesController.add(roomId);
  }

  /// Handles booking notifications.
  ///
  /// Retrieves the 'bookingId' from the [message] data and adds it to the
  /// session stream for further processing.
  Future<void> _handleBookingNotification(RemoteMessage message) async {
    final bookingId = message.data['bookingId'] as String?;
    if (bookingId == null) return;
    _bookingMessagesController.add(bookingId);
  }

  /// Initializes local notifications using [FlutterLocalNotificationsPlugin].
  ///
  /// Sets up the Android notification channel and handles tap event
  /// on foreground notifications.
  Future<void> _initializeLocalNotifications() async {
    await _initializeIosForegroundNotifications();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    await _localNotifications.initialize(
      const InitializationSettings(android: android),
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload == null) return;
        final message = RemoteMessage.fromMap(
          jsonDecode(payload) as Map<String, dynamic>,
        );
        log('foreground tap: ${message.toMap()}');
        _handleNotificationBasedOnType(message);
      },
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  /// Configures foreground notification presentation options for iOS devices.
  Future<void> _initializeIosForegroundNotifications() {
    return _messagingInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// Retrieves an image from a [url] and converts it to a base64-encoded
  /// string.
  Future<String> _base64encodedImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final base64Data = base64Encode(response.bodyBytes);
    return base64Data;
  }
}
