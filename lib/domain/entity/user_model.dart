class UserModel {
  UserModel({
    required this.id,
    this.phoneNumber,
    this.pinCode,
    this.nameTag,
    this.photo,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
  });

  final String id;
  final String? phoneNumber;
  final String? pinCode;
  final String? photo;
  final String? nameTag;
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
}
