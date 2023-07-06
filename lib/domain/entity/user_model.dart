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

  UserModel copyWith({
    String? id,
    String? phoneNumber,
    String? pinCode,
    String? photo,
    String? nameTag,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
  }) {
    return UserModel(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      pinCode: pinCode ?? this.pinCode,
      photo: photo ?? this.photo,
      nameTag: nameTag ?? this.nameTag,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
