import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/waiting_session/widgets/waiting_session_action.dart';

import '../../../../../gen/assets.gen.dart';

class WaitingSessionActionList extends StatelessWidget {
  const WaitingSessionActionList({
    super.key,
    this.onCall,
    this.onVideo,
    this.onChat,
  });

  final VoidCallback? onCall;
  final VoidCallback? onVideo;
  final VoidCallback? onChat;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: double.infinity,
      child: IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WaitingSessionAction(
                    svgIcon: Assets.svg.call,
                    title: l10n.call,
                    onTap: onCall,
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: WaitingSessionAction(
                    svgIcon: Assets.svg.video,
                    title: l10n.video,
                    onTap: onVideo,
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: WaitingSessionAction(
                    svgIcon: Assets.svg.chat,
                    title: l10n.chat,
                    onTap: onChat,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
