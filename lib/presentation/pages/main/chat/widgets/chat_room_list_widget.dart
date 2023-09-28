import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoomListWidget extends StatelessWidget {
  const ChatRoomListWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(16.w),
        child: itemBuilder(context, index),
      ),
      separatorBuilder: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: const Divider(),
      ),
    );
  }
}
