import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer(
    this.child, {
    super.key,
    required this.isSender,
    required this.isLast,
    required this.createdAt,
  });

  final Widget child;
  final bool isSender;
  final bool isLast;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(11.w),
          decoration: BoxDecoration(
            borderRadius: !isLast
                ? BorderRadius.circular(10.r)
                : isSender
                    ? BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
            color: isSender
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
          child: child,
        ),
        if (isLast) ...[
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
