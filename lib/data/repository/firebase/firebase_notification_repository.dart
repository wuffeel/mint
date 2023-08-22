import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:mint/backbone/notification_type.dart';
import 'package:mint/data/model/fcm_token_dto/fcm_token_dto.dart';
import 'package:mint/data/repository/abstract/notification_repository.dart';
import 'package:mint/domain/controller/notification_controller.dart';
import 'package:mint/utils/notification_to_short_string.dart';

@Injectable(as: NotificationRepository)
class FirebaseNotificationRepository implements NotificationRepository {
  FirebaseNotificationRepository(this._notificationController);

  final NotificationController _notificationController;

  final _messagingInstance = FirebaseMessaging.instance;
  final _firestoreInstance = FirebaseFirestore.instance;
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  static const _tokenCollection = 'fcmTokens';

  CollectionReference get _tokenCollectionRef =>
      _firestoreInstance.collection(_tokenCollection);

  @override
  Future<void> initializeNotifications(String userId) async {
    final settings = await _messagingInstance.requestPermission();
    if (settings.authorizationStatus.name == 'denied') return;

    final fcmToken = await _messagingInstance.getToken();
    if (fcmToken == null) return;
    log('fcmToken: $fcmToken');

    await _updateToken(fcmToken, userId);
    _listenTokenChange(userId);

    await _handleAppNotifications();
    await _initializeLocalNotifications();
  }

  void _listenTokenChange(String userId) {
    _messagingInstance.onTokenRefresh.listen((fcmToken) {
      _updateToken(fcmToken, userId);
    }).onError((Object error) {
      log('tokenRefreshError: $error');
    });
  }

  Future<void> _updateToken(String fcmToken, String userId) async {
    final tokenDoc = _tokenCollectionRef.doc(userId);
    final tokenSnap = await tokenDoc.get();

    if (!tokenSnap.exists || _shouldUpdateToken(tokenSnap, fcmToken)) {
      await _setFcmToken(tokenDoc, fcmToken);
    }
  }

  bool _shouldUpdateToken(DocumentSnapshot tokenSnap, String fcmToken) {
    final data = tokenSnap.data() as Map<String, dynamic>?;
    if (data == null) return false;

    final fcmTokenDto = FcmTokenDto.fromJson(data);
    final expirationTime = DateTime.now().subtract(const Duration(days: 30));

    return fcmTokenDto.createdAt.isBefore(expirationTime) ||
        fcmTokenDto.token != fcmToken;
  }

  Future<void> _setFcmToken(DocumentReference tokenDoc, String fcmToken) {
    return tokenDoc.set({
      'token': fcmToken,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> _handleAppNotifications() async {
    // Handles user navigation on message tap for background notification.
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log('onMessageOpenedApp: ${message.toMap()}');
      _handleNotificationBasedOnType(message);
    });

    // Handling foreground notifications.
    FirebaseMessaging.onMessage.listen((message) async {
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
                ? ByteArrayAndroidBitmap.fromBase64String(
                    base64Image,
                  )
                : null,
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });

    // Terminated notification. Gets the notification info.
    await _messagingInstance.getInitialMessage().then((terminatedMessage) {
      if (terminatedMessage == null) return;
      log('getInitialMessage: ${terminatedMessage.toMap()}');
    });
  }

  /// Handles notifications by type.
  ///
  /// Processes incoming notifications based on their 'notificationType'
  /// field.
  /// If a matching notification type is found, the corresponding handler is
  /// invoked.
  void _handleNotificationBasedOnType(RemoteMessage message) {
    final notificationType = message.data['notificationType'] as String?;
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
    _notificationController.addToChatStream(roomId);
  }

  /// Handles booking notifications.
  ///
  /// Retrieves the 'bookingId' from the [message] data and adds it to the
  /// session stream for further processing.
  Future<void> _handleBookingNotification(RemoteMessage message) async {
    final bookingId = message.data['bookingId'] as String?;
    if (bookingId == null) return;
    _notificationController.addToSessionStream(bookingId);
  }

  Future<void> _initializeLocalNotifications() async {
    await _initializeIosForegroundNotifications();

    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    final initialized = await _localNotifications.initialize(
      const InitializationSettings(
        iOS: iOS,
        android: android,
      ),
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload == null) return;
        final message = RemoteMessage.fromMap(
          jsonDecode(payload) as Map<String, dynamic>,
        );
        log('foreground tap: ${message.toMap()}');
        final notificationType = message.data['notificationType'];
        if (notificationType != null && notificationType == 'chat') {
          _handleChatNotification(message);
        } else if (notificationType == 'booking') {
          _handleBookingNotification(message);
        }
      },
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);

    log('localInitialized: $initialized');
  }

  Future<void> _initializeIosForegroundNotifications() {
    return _messagingInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<String> _base64encodedImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final base64Data = base64Encode(response.bodyBytes);
    return base64Data;
  }
}
