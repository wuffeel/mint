import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mint/bootstrap.dart';
import 'package:mint/presentation/app/app.dart';

import 'injector/injector.dart';

Future<void> main() async {
  // TODO(wuffel): where this one should be moved?
  Stripe.publishableKey = 'pk_test_51NXisMDM3y3HeQ88i2SIRHpLikPb7J63tZj5lQvKbK'
      'sWK3rJQJDs1ZmNX3wvxajQW58bSQmmblaD9YUHh8WZ86jx00qBiTC44O';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  await Stripe.instance.applySettings();
  FirebaseChatCore.instance.setConfig(
    const FirebaseChatCoreConfig(null, 'chat_rooms', 'chat_users'),
  );
  configureDependencies();
  await bootstrap(App.new);
}
