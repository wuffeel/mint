import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_app_bar.dart';
import 'package:mint/presentation/pages/main/chat/widgets/chat_bottom_bar.dart';
import 'package:mint/presentation/pages/main/chat/widgets/message_container.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.specialistModel});

  final SpecialistModel specialistModel;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(specialistModel: widget.specialistModel),
      body: Column(
        children: <Widget>[
          SizedBox(height: 24.h),
          Text(
            'Today, 18:30',
            style: MintTextStyles.caption1.copyWith(
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: <Widget>[
                MessageContainer(
                  'Hello',
                  isReceiver: false,
                  isLast: false,
                  createdAt: DateTime.now(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: MessageContainer(
                    'Hello',
                    isReceiver: true,
                    isLast: true,
                    createdAt: DateTime.now(),
                  ),
                ),
                MessageContainer(
                  'How are you',
                  isReceiver: false,
                  isLast: true,
                  createdAt: DateTime.now(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: MessageContainer(
                    'Fine',
                    isReceiver: true,
                    isLast: true,
                    createdAt: DateTime.now(),
                  ),
                ),
              ],
            ),
          ),
          ChatBottomBar(controller: _messageController),
        ],
      ),
    );
  }
}
