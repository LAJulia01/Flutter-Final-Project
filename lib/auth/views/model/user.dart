import 'package:nannycare/views/review/Review_Page.dart';

class UserData {
  final String fullname;
  final String age;
  final String gender;
  final String address;
  final String name;
  final String password;
  final String email;
  final String description;
  final double hourlyRate;
  final int numOfReviews;
  final List<UserReview> reviewersList; // Assuming UserReview is another class for reviews

  UserData({
    required this.fullname,
    required this.age,
    required this.gender,
    required this.address,
    required this.name,
    required this.password,
    required this.email,
    required this.description,
    required this.hourlyRate,
    required this.numOfReviews,
    required this.reviewersList,
  });

  // The 'fromJson' method will convert a JSON map into a 'UserData' object.
  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      fullname: json['fullname'],
      age: json['age'],
      gender: json['gender'],
      address: json['address'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
      description: json['description'] ?? '',  // Default empty string if not provided
      hourlyRate: (json['hourlyRate'] as num).toDouble(),  // Convert to double if it's a numeric value
      numOfReviews: json['numOfReviews'] ?? 0, // Default to 0 if not provided
      reviewersList: List<UserReview>.from(
        (json['reviewersList'] as List).map((reviewJson) => UserReview.fromJson(reviewJson)),
      ),
    );
  }

  // The 'toJson' method converts a 'UserData' object into a JSON map for storage (e.g., Firestore).
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'age': age,
      'gender': gender,
      'address': address,
      'name': name,
      'password': password,
      'email': email,
      'description': description,
      'hourlyRate': hourlyRate,
      'numOfReviews': numOfReviews,
      'reviewersList': [
    {
      "reviewerName": name,
      "reviewText": description,
      "rating": 5,
    },
  ],
    };
  }
}
