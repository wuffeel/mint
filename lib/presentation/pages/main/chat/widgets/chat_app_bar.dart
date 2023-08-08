import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';

import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_app_bar.dart';
import '../../../../widgets/mint_circle_avatar.dart';
import '../../../../widgets/specialist_full_name_text.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key, required this.specialistModel});

  final SpecialistModel specialistModel;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: MintAppBar(
        centerTitle: true,
        title: SpecialistFullNameText(
          firstName: specialistModel.firstName,
          lastName: specialistModel.lastName,
          textStyle: MintTextStyles.headline1,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.w),
            child: MintCircleAvatar(
              radius: 14.w,
              photoUrl: specialistModel.photoUrl,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
