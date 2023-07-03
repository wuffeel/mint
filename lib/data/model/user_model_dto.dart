class UserModelDto {
  UserModelDto({
    required this.id,
    this.phoneNumber,
    this.nameTag,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
  });

  final String id;
  final String? phoneNumber;
  final String? nameTag;
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
}
