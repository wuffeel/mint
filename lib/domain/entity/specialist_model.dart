class SpecialistModel {
  SpecialistModel(
    this.id,
    this.firstName,
    this.lastName,
    this.price,
    this.rating,
    this.experience,
    this.photoUrl,
  );

  final String id;
  final String firstName;
  final String lastName;
  final num price;
  final num experience;
  final num rating;
  final String? photoUrl;

  SpecialistModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    num? price,
    num? rating,
    num? experience,
    String? photoUrl,
  }) {
    return SpecialistModel(
      id ?? this.id,
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      price ?? this.price,
      rating ?? this.rating,
      experience ?? this.experience,
      photoUrl ?? this.photoUrl,
    );
  }
}
