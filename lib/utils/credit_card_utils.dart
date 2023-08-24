import '../gen/assets.gen.dart';

class CreditCardUtils {
  static SvgGenImage? getCardIconByBrand(
    String brand, {
    bool isColored = false,
  }) {
    const svgPath = Assets.svg;
    switch (brand.toLowerCase()) {
      case 'amex':
      case 'americanexpress':
        return isColored
            ? svgPath.americanExpressColored
            : svgPath.americanExpressIcon;
      case 'visa':
        return isColored ? svgPath.visaColored : svgPath.visaIcon;
      case 'mastercard':
        return isColored ? svgPath.mastercardColored : svgPath.mastercardIcon;
    }
    return null;
  }
}
