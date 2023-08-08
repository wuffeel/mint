import 'package:flutter_dotenv/flutter_dotenv.dart';

final stripePublicKey = dotenv.env['STRIPE_PUBLIC_KEY'] ?? '';