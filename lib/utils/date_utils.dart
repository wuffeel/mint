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
    // TODO(wuffeel): should this function be nullable?
    // The problem is that theoretically createdAt field must necessarily
    // exist in database
    // throw ArgumentError()?
    return DateTime.now();
  }
}
