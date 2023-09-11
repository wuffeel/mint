import 'package:flutter/material.dart';
import 'package:mint/bootstrap.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/presentation/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await bootstrap(App.new);
}
