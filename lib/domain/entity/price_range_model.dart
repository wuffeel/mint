class PriceRangeModel {
  PriceRangeModel({
    this.lowPrice,
    this.highPrice,
  });

  /// Comparison _from_ value
  ///
  /// Used in a way: __specialistPrice >= [lowPrice]__
  final int? lowPrice;

  /// Comparison _to_ value
  ///
  /// Used in a way: __specialistPrice <= [lowPrice]__
  final int? highPrice;

  /// Method used to convert tags like 'up\___N__', '__N__\___N__', 'gt\___N__',
  /// (where __N__ is some int number) to [PriceRangeModel]
  ///
  /// Examples:
  /// ```dart
  /// fromTag('up_1000') => lowPrice = 1000
  /// fromTag('500_1000') => lowPrice = 500, highPrice = 1000
  /// fromTag('gt_1000) => lowPrice = 1000
  /// ```
  static PriceRangeModel? fromTag(String tag) {
    final lessOrMoreRegex = RegExp(r'^(up|gt)_?(\d+)$');
    final rangeRegex = RegExp(r'^(\d+)_(\d+)$');

    final lessOrMoreMatch = lessOrMoreRegex.matchAsPrefix(tag);
    final rangeMatch = rangeRegex.matchAsPrefix(tag);

    if (lessOrMoreMatch != null) {
      final prefix = lessOrMoreMatch[1];
      final priceString = lessOrMoreMatch[2];
      if (prefix == null || priceString == null) return null;

      final price = int.parse(priceString);

      int? lowPrice;
      int? highPrice;

      if (prefix == 'up') {
        highPrice = price;
      } else if (prefix == 'gt') {
        lowPrice = price;
      } else {
        return null;
      }

      return PriceRangeModel(
        lowPrice: lowPrice,
        highPrice: highPrice,
      );
    } else if (rangeMatch != null) {
      final lowPriceString = rangeMatch[1];
      final highPriceString = rangeMatch[2];
      if (lowPriceString == null || highPriceString == null) return null;

      final lowPrice = int.parse(lowPriceString);
      final highPrice = int.parse(highPriceString);

      return PriceRangeModel(
        lowPrice: lowPrice,
        highPrice: highPrice,
      );
    }

    return null;
  }
}
