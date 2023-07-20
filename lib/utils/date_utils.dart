import 'package:cloud_firestore/cloud_firestore.dart';

class DateUtils {
  static DateTime convertToDateTime(dynamic value) {
    if (value is DateTime) {
      return value;
    } else if (value is Timestamp) {
      return value.toDate();
    } else if (value is String) {
      return DateTime.parse(value);
    }
    throw ArgumentError.value(value);
  }

  static List<DateTime> convertToDateTimeList(List<dynamic> dateList) {
    return dateList.map((date) {
      if (date is DateTime) {
        return date;
      } else if (date is Timestamp) {
        return date.toDate();
      } else if (date is String) {
        return DateTime.parse(date);
      }
      throw ArgumentError.value(date);
    }).toList();
  }

  static DateTime? tryConvertToDateTime(dynamic value) {
    if (value is DateTime) {
      return value;
    } else if (value is Timestamp) {
      return value.toDate();
    } else if (value is String) {
      return DateTime.parse(value);
    }
    return null;
  }
}
