class BookingDuplicateException implements Exception {
  BookingDuplicateException({this.code, this.message});

  final String? code;
  final String? message;

  @override
  String toString() => '$code: $message';
}
