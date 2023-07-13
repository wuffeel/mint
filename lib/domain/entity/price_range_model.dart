// TODO(wuffeel): should it be renamed?
class PriceRangeModel {
  PriceRangeModel({
    required this.title,
    this.lowPrice,
    this.highPrice,
  });

  /// A string representation of tag. Can be either:
  ///
  ///
  /// Up to __N__₴
  ///
  /// __N__-__N__₴
  ///
  /// __N__₴ and more
  ///
  /// Where __N__ is some integer value representing price value
  final String title;

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
        title: _getTitleByPrefix(prefix, price),
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
        title: '$lowPriceString-$highPriceString₴',
        lowPrice: lowPrice,
        highPrice: highPrice,
      );
    }

    return null;
  }

  /// Returns a corresponding [title] depending on [prefix] passed
  static String _getTitleByPrefix(String prefix, int price) {
    switch (prefix) {
      case 'up':
        return 'Up to $price₴';
      case 'gt':
        return '$price₴ and more';
    }
    return '';
  }
}
