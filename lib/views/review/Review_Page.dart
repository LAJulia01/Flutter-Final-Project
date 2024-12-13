class UserReview {
  final String reviewerName;
  final String reviewText;
  final int rating;

  UserReview({
    required this.reviewerName,
    required this.reviewText,
    required this.rating,
  });

  // Convert JSON to UserReview object
  static UserReview fromJson(Map<String, dynamic> json) {
    return UserReview(
      reviewerName: json['reviewerName'],
      reviewText: json['reviewText'],
      rating: json['rating'],
    );
  }

  // Convert UserReview object to JSON
  Map<String, dynamic> toJson() {
    return {
      'reviewerName': reviewerName,
      'reviewText': reviewText,
      'rating': rating,
    };
  }
}
