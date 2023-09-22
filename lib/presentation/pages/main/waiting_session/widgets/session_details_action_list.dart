import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/waiting_session/widgets/session_details_action.dart';
import 'package:mint_core/mint_bloc.dart';

import '../../../../../gen/assets.gen.dart';

class SessionDetailsActionList extends StatelessWidget {
  const SessionDetailsActionList({
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
            child: BlocBuilder<ChatBlocPatient, ChatState>(
              builder: (context, state) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: SessionDetailsAction(
                        svgIcon: Assets.svg.call,
                        title: l10n.call,
                        onTap: onCall,
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: SessionDetailsAction(
                        svgIcon: Assets.svg.video,
                        title: l10n.video,
                        onTap: onVideo,
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: state is! ChatFetchRoomLoading
                          ? SessionDetailsAction(
                              svgIcon: Assets.svg.chat,
                              title: l10n.chat,
                              onTap: onChat,
                            )
                          : _ActionLoadingIndicator(size: 25.w),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionLoadingIndicator extends StatelessWidget {
  const _ActionLoadingIndicator({this.size = 25});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
