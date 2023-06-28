import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mint/bootstrap.dart';
import 'package:mint/presentation/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( );
  await bootstrap(App.new);
}
