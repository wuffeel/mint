import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mint/bootstrap.dart';
import 'package:mint/env_constants.dart';
import 'package:mint/presentation/app/app.dart';

import 'injector/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  await init();
  Stripe.publishableKey = stripePublicKey;
  await Stripe.instance.applySettings();
  FirebaseChatCore.instance.setConfig(
    const FirebaseChatCoreConfig(null, 'chat_rooms', 'chat_users'),
  );
  configureDependencies();
  await bootstrap(App.new);
}
