class UserModelDto {
  UserModelDto({
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
  final String? nameTag;
  final String? photo;
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
}
