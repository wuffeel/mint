import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/bottom_sheet_app_bar.dart';

import '../../../../../theme/mint_text_styles.dart';

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({super.key, this.onClear});

  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomSheetAppBar(
      title: Text(l10n.filterTitle, style: MintTextStyles.title2),
      actions: [
        TextButton(
          onPressed: onClear,
          child: Text(
            l10n.clear,
            style: MintTextStyles.tagBig.copyWith(
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
