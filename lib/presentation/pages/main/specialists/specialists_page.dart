import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/specialists/widgets/filter_bottom_sheet.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/presentation/widgets/mint_back_button.dart';
import 'package:mint/presentation/widgets/specialist_catalogue_container.dart';

import '../../../../gen/assets.gen.dart';

@RoutePage()
class SpecialistsPage extends StatefulWidget {
  const SpecialistsPage({super.key});

  @override
  State<SpecialistsPage> createState() => _SpecialistsPageState();
}

class _SpecialistsPageState extends State<SpecialistsPage> {
  void _showFilterModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return Scaffold(
      appBar: MintAppBar(
        leading: MintBackButton(
          onPressed: () => tabsRouter.setActiveIndex(
            tabsRouter.previousIndex ?? 0,
          ),
        ),
        leadingWidth: 80.w,
        actions: [
          IconButton(
            onPressed: () => _showFilterModalBottomSheet(context),
            icon: Assets.svg.filterIcon.svg(
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ?? Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: const SpecialistCatalogueContainer(),
    );
  }
}
