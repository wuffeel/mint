import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mint/bootstrap.dart';
import 'package:mint/env_constants.dart';
import 'package:mint/presentation/app/app.dart';

import 'injector/injector.dart';

/// According to Firebase docs, when handling background/terminated notifications
/// there are two things to keep in mind:
/// 1. It must not be an anonymous function.
/// 2. It must be a top-level function (e.g. not a class method which requires
/// initialization).
///
/// Attempts on wrapping [FirebaseMessaging.onBackgroundMessage] in a function
/// will cause 'Null check operator was used on a null value' exception.
///
/// See https://firebase.flutter.dev/docs/messaging/usage/#background-messages
@pragma('vm:entry-point')
Future<void> _backgroundMessageHandler(RemoteMessage message) async {
  // TODO(wuffeel): handle background & terminated notifications
  log('handleBackgroundMessage: ${message.toMap()}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  Stripe.publishableKey = stripePublicKey;
  await Stripe.instance.applySettings();
  FirebaseChatCore.instance.setConfig(
    const FirebaseChatCoreConfig(null, 'chat_rooms', 'chat_users'),
  );
  FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  configureDependencies();
  await bootstrap(App.new);
}
