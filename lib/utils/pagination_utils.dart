import 'package:flutter/cupertino.dart';

class PaginationUtils {
  /// Checks whether the scroll position controlled by the [controller]
  /// has reached or exceeded [overScrollExtent].
  ///
  /// The [overScrollExtent] parameter determines the proportion of the maximum
  /// scroll extent at which over-scrolling is considered to have occurred.
  /// The default value is 0.8 (80% of the maximum scroll extent).
  ///
  /// Returns `true` if over-scrolling has occurred, otherwise `false`.
  ///
  /// If the [controller] doesn't have any scrollable content or has no clients,
  /// this function returns `false`.
  static bool isOverScroll(
    ScrollController controller, {
    double overScrollExtent = 0.8,
  }) {
    if (!controller.hasClients) return false;
    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.offset;
    return currentScroll >= (maxScroll * overScrollExtent);
  }
}
