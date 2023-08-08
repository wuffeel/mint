import 'package:flutter/material.dart';

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {super.key, this.textStyle});

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('• ', style: textStyle),
        Expanded(child: Text(text, style: textStyle)),
      ],
    );
  }
}
