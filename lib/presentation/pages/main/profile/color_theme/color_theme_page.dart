import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/profile/widgets/custom_switch.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../bloc/color_theme/color_theme_bloc.dart';

@RoutePage()
class ColorThemePage extends StatefulWidget {
  const ColorThemePage({super.key});

  @override
  State<ColorThemePage> createState() => _ColorThemePageState();
}

class _ColorThemePageState extends State<ColorThemePage> {
  void _onColorThemeChange(bool themeState) {
    context.read<ColorThemeBloc>().add(
          ColorThemeSwitchRequested(
            themeState ? ThemeMode.dark : ThemeMode.light,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MintAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(context.l10n.chooseYourTheme, style: MintTextStyles.headline),
            SizedBox(height: 16.h),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: BlocBuilder<ColorThemeBloc, ColorThemeState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          state.theme == ThemeMode.light
                              ? context.l10n.lightModeTitle
                              : context.l10n.darkModeTitle,
                          style: MintTextStyles.tab16,
                        ),
                        CustomSwitch(
                          value: state.theme == ThemeMode.dark,
                          onChanged: _onColorThemeChange,
                          width: 51.w,
                          height: 31.h,
                          switchWidth: 27.w,
                          switchHeight: 27.h,
                          enabledColor: Colors.black,
                          disabledColor:
                              MintColors.switchDisabledLight.withOpacity(0.16),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
