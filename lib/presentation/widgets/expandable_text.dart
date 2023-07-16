import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/colors.gen.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    super.key,
    required this.style,
    required this.maxLines,
  });

  final String text;
  final TextStyle style;
  final int maxLines;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  Color _getArrowColor() {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.greyDark.withOpacity(0.6)
        : MintColors.quarternary1;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(text: widget.text, style: widget.style);
        final tp = TextPainter(text: span, textDirection: TextDirection.ltr)
          ..layout(maxWidth: constraints.maxWidth);
        final numberOfLines = tp.computeLineMetrics().length;

        return numberOfLines <= widget.maxLines
            ? Text(
                widget.text,
                style: widget.style,
              )
            : Column(
                children: <Widget>[
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    firstChild: Text(
                      widget.text,
                      maxLines: widget.maxLines,
                      overflow: TextOverflow.ellipsis,
                      style: widget.style,
                    ),
                    secondChild: Text(
                      widget.text,
                      style: widget.style,
                    ),
                    crossFadeState: _isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                  ),
                  SizedBox(height: 12.h),
                  Align(
                    child: InkWell(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: _getArrowColor(),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
