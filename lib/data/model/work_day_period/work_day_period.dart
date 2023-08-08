import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_day_period.freezed.dart';

part 'work_day_period.g.dart';

@freezed
class WorkDayPeriod with _$WorkDayPeriod {
  const factory WorkDayPeriod({
    required String start,
    required String end,
  }) = _WorkDayPeriod;

  factory WorkDayPeriod.fromJson(Map<String, dynamic> json) =>
      _$WorkDayPeriodFromJson(json);
}
