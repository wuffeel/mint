enum ReviewSession {
  helpful(rating: 5),
  useful(rating: 4.5),
  good(rating: 4),
  poor(rating: 3),
  notHelpful(rating: 2),
  doNotRecommend(rating: 1);

  const ReviewSession({required this.rating});

  final double rating;
}
