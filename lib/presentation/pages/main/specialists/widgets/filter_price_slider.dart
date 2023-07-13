import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/custom_range_thumb_shape.dart';

class FilterPriceSlider extends StatefulWidget {
  const FilterPriceSlider({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.rangeValues,
    required this.onChangeEnd,
  });

  final int minPrice;
  final int maxPrice;
  final RangeValues rangeValues;
  final void Function(RangeValues) onChangeEnd;

  @override
  State<FilterPriceSlider> createState() => _FilterPriceSliderState();
}

class _FilterPriceSliderState extends State<FilterPriceSlider> {
  late RangeValues _rangeValues = widget.rangeValues;

  @override
  void didUpdateWidget(covariant FilterPriceSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    _rangeValues = widget.rangeValues;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: Theme.of(context).sliderTheme.copyWith(
            rangeThumbShape: CustomRangeThumbShape(
              thumbSize: 12.r,
              values: _rangeValues,
              textColor: Theme.of(context).primaryColor,
            ),
          ),
      child: RangeSlider(
        min: widget.minPrice.toDouble(),
        max: widget.maxPrice.toDouble(),
        values: _rangeValues,
        onChanged: (values) => setState(() {
          _rangeValues = values;
        }),
        onChangeEnd: widget.onChangeEnd,
      ),
    );
  }
}
