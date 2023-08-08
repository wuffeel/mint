import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';

class ErrorSnackBar extends SnackBar {
  const ErrorSnackBar({super.key, required super.content})
      : super(backgroundColor: MintColors.error);
}
