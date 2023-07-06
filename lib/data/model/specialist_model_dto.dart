class SpecialistModelDto {
  SpecialistModelDto(
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
  final num rating;
  final num experience;
  final String? photoUrl;
}
