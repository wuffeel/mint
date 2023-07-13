import 'package:auto_route/auto_route.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/specialist_details_widget.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/specialist_tab_bar_delegate.dart';
import 'package:mint/presentation/widgets/favorite_button.dart';

import '../../../../theme/mint_text_styles.dart';
import '../../../widgets/mint_back_button.dart';

@RoutePage()
class SpecialistDetailsPage extends StatefulWidget {
  const SpecialistDetailsPage({super.key, required this.specialistModel});

  final SpecialistModel specialistModel;

  @override
  State<SpecialistDetailsPage> createState() => _SpecialistDetailsPageState();
}

class _SpecialistDetailsPageState extends State<SpecialistDetailsPage> {
  final tabs = ['About', 'Education', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: ExtendedSliverAppbar(
                  leading: const MintBackButton(),
                  actions: FavoriteButton(
                    onTap: () {},
                    isFavorite: false,
                    isActionButton: true,
                  ),
                  toolBarColor: Theme.of(context).scaffoldBackgroundColor,
                  background: ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: SpecialistDetailsWidget(
                      specialistModel: widget.specialistModel,
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SpecialistTabBarDelegate(
                  const TabBar(
                    tabs: <Widget>[
                      Tab(child: Text('About')),
                      Tab(child: Text('Education')),
                      Tab(child: Text('Reviews')),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: List.generate(tabs.length, (index) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(tabs[index]),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context,
                          ),
                        ),
                        if (index == 0)
                          SliverPadding(
                            padding: EdgeInsets.all(16.r),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                widget.specialistModel.about ?? '',
                                style: MintTextStyles.body1,
                              ),
                            ),
                          ),
                        if (index == 1)
                          SliverPadding(
                            padding: EdgeInsets.all(16.r),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                widget.specialistModel.education ?? '',
                                style: MintTextStyles.body1,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
