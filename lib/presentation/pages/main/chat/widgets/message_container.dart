import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/theme/mint_text_styles.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer(
    this.message, {
    super.key,
    required this.isReceiver,
    required this.isLast,
    required this.createdAt,
  });

  final bool isReceiver;
  final bool isLast;
  final String message;
  final DateTime createdAt;

  bool _isThemeDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  Color _getMessageTextColor(BuildContext context) {
    return _isThemeDark(context)
        ? Colors.white
        : isReceiver
            ? Colors.black
            : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(11.w),
          decoration: BoxDecoration(
            borderRadius: !isLast
                ? BorderRadius.circular(10.r)
                : isReceiver
                    ? BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
            color: isReceiver
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
          ),
          child: Text(
            message,
            style: MintTextStyles.proximaNovaRegular.copyWith(
              color: _getMessageTextColor(context),
            ),
          ),
        ),
        if (isLast && !isReceiver) ...[
          SizedBox(height: 8.h),
          Text(
            DateFormat.Hm().format(createdAt),
            style: TextStyle(
              fontSize: 10.sp,
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          ),
        ],
      ],
    );
  }
}
