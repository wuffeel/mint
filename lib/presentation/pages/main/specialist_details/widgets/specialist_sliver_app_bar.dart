import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/specialist_details/widgets/fade_on_scroll.dart';

class SpecialistSliverAppBar extends StatefulWidget {
  const SpecialistSliverAppBar({
    super.key,
    required this.scrollController,
    this.flexibleSpace,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.bottom,
    this.forceElevated = false,
    this.backgroundColor,
    this.floating = false,
    this.pinned = false,
    this.snap = false,
    this.toolbarHeight = kToolbarHeight,
    this.leadingWidth,
  });

  final ScrollController scrollController;
  final Widget? flexibleSpace;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool forceElevated;
  final Color? backgroundColor;
  final bool floating;
  final bool pinned;
  final bool snap;
  final double toolbarHeight;
  final double? leadingWidth;

  @override
  State<SpecialistSliverAppBar> createState() => _SpecialistSliverAppBarState();
}

class _SpecialistSliverAppBarState extends State<SpecialistSliverAppBar> {
  /// Used to set the key for initially displayed widget, the size of which
  /// will be calculated
  final GlobalKey _initialWidgetKey = GlobalKey();

  /// Variable used for setting SliverAppBar's expanded height for flexible
  /// space to be shown
  ///
  /// As long as the height is 0 instead of the sliver app bar
  /// a sliver to box adapter will be used to calculate dynamically the size
  /// for the sliver app bar
  double? _flexibleSpaceHeight = 0;

  @override
  void initState() {
    super.initState();
    _updateFlexibleSpaceHeight();
  }

  /// Function to set the [_flexibleSpaceHeight] based on widget height
  /// associated with [_initialWidgetKey]
  void _updateFlexibleSpaceHeight() {
    // Gets the new height and updates the sliver app bar. Needs to be called
    // after the last frame has been rebuild otherwise this will throw an error
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_initialWidgetKey.currentContext == null) return;
      setState(() {
        final initialWidget =
            _initialWidgetKey.currentContext?.findRenderObject() as RenderBox?;

        _flexibleSpaceHeight = initialWidget?.size.height;
        // Adding status bar height to total height
        var heightLocal = _flexibleSpaceHeight;
        if (heightLocal != null) {
          heightLocal += MediaQuery.paddingOf(context).top;
        }
        _flexibleSpaceHeight = heightLocal;
      });
    });
  }

  double _getFadeOffset() {
    var height = _flexibleSpaceHeight;
    if (height == null) return 0;

    final bottom = widget.bottom;
    if (bottom != null) height -= bottom.preferredSize.height;
    return height - kToolbarHeight - MediaQuery.paddingOf(context).top;
  }

  @override
  void didUpdateWidget(covariant SpecialistSliverAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateFlexibleSpaceHeight();
  }

  @override
  Widget build(BuildContext context) {
    // Needed to lay out the flexibleSpace the first time,
    // so we can calculate its intrinsic height
    if (_flexibleSpaceHeight == 0) {
      return SliverToBoxAdapter(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  key: _initialWidgetKey,
                  child: widget.flexibleSpace ??
                      const SizedBox(height: kToolbarHeight),
                ),
                widget.bottom ?? const SizedBox.shrink(),
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: widget.automaticallyImplyLeading,
                  leading: widget.leading,
                  leadingWidth: 80.w,
                  actions: widget.actions,
                  toolbarHeight: widget.toolbarHeight,
                ),
              ),
            )
          ],
        ),
      );
    }

    return SliverAppBar(
      leading: widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      actions: widget.actions,
      bottom: widget.bottom,
      forceElevated: widget.forceElevated,
      backgroundColor: widget.backgroundColor,
      floating: widget.floating,
      pinned: widget.pinned,
      snap: widget.snap,
      toolbarHeight: widget.toolbarHeight,
      expandedHeight: _flexibleSpaceHeight,
      leadingWidth: widget.leadingWidth,
      flexibleSpace: FadeOnScroll(
        scrollController: widget.scrollController,
        zeroOpacityOffset: _getFadeOffset(),
        child: FlexibleSpaceBar(background: widget.flexibleSpace),
      ),
    );
  }
}
