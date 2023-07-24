import 'package:flutter/material.dart';
import 'package:mint/presentation/pages/main/checkout/widgets/unordered_list_item.dart';

class UnorderedList extends StatelessWidget {
  const UnorderedList(
    this.textList, {
    super.key,
    required this.spaceBetween,
    this.textStyle,
  });

  final List<String> textList;
  final double spaceBetween;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final widgetList = <Widget>[];
    for (final text in textList) {
      widgetList
        ..add(UnorderedListItem(text, textStyle: textStyle))
        ..add(SizedBox(height: spaceBetween));
    }

    return Column(children: widgetList);
  }
}
