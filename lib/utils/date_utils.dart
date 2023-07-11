import 'package:cloud_firestore/cloud_firestore.dart';

class DateUtils {
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
