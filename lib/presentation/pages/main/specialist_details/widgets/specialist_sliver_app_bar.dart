import 'package:flutter/material.dart';
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
    this.toolbarHeight = kToolbarHeight + 20,
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
  final GlobalKey _childKey = GlobalKey();

  // As long as the height is 0 instead of the sliver app bar
  // a sliver to box adapter will be used  to calculate dynamically the size
  // for the sliver app bar
  double? _height = 0;

  @override
  void initState() {
    super.initState();
    _updateHeight();
  }

  void _updateHeight() {
    // Gets the new height and updates the sliver app bar. Needs to be called
    // after the last frame has been rebuild otherwise this will throw an error
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_childKey.currentContext == null) return;
      setState(() {
        _height = (_childKey.currentContext?.findRenderObject() as RenderBox?)
            ?.size
            .height;
      });
    });
  }

  double _getFadeOffset() {
    var height = _height;
    if (height == null) return 0;

    final bottom = widget.bottom;
    if (bottom != null) height -= bottom.preferredSize.height;
    return height - kToolbarHeight - MediaQuery.paddingOf(context).top;
  }

  @override
  void didUpdateWidget(covariant SpecialistSliverAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateHeight();
  }

  @override
  Widget build(BuildContext context) {
    // Needed to lay out the flexibleSpace the first time,
    // so we can calculate its intrinsic height
    if (_height == 0) {
      return SliverToBoxAdapter(
        child: Stack(
          children: [
            Padding(
              // Padding which centers the flexible space within the app bar
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.paddingOf(context).top / 2,
              ),
              child: Container(
                key: _childKey,
                child: widget.flexibleSpace ??
                    const SizedBox(
                      height: kToolbarHeight,
                    ),
              ),
            ),
            Positioned.fill(
              // 10 is the magic number which the app bar is pushed down within
              // the sliver app bar. Couldn't find exactly where this number
              // comes from and found it through trial and error.
              top: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: widget.leading,
                  actions: widget.actions,
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
      expandedHeight: _height,
      leadingWidth: widget.leadingWidth,
      flexibleSpace: FadeOnScroll(
        scrollController: widget.scrollController,
        zeroOpacityOffset: _getFadeOffset(),
        child: FlexibleSpaceBar(background: widget.flexibleSpace),
      ),
    );
  }
}
