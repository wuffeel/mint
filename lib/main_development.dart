import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mint/bootstrap.dart';
import 'package:mint/env_constants.dart';
import 'package:mint/presentation/app/app.dart';
import 'package:path_provider/path_provider.dart';

import 'injector/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  Stripe.publishableKey = stripePublicKey;
  await Stripe.instance.applySettings();
  configureDependencies();
  await bootstrap(App.new);
}
