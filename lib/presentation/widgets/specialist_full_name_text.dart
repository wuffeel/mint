import 'package:flutter/material.dart';

class SpecialistFullNameText extends StatelessWidget {
  const SpecialistFullNameText({
    super.key,
    required this.firstName,
    required this.lastName,
    this.textStyle,
  });

  final String firstName;
  final String lastName;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$firstName $lastName',
      style: textStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
