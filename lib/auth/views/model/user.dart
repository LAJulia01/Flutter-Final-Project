class UserData {
  // final String id;
  final String name;
  final String password;
  // final String contact;
  // final String otp;
  final String email;

  UserData({
    // required this.id,
    required this.name, 
    required this.password, 
    // required this.contact,
    // required this.otp, 
    required this.email,
  });

  static UserData fromJson(Map<String, dynamic> json) => UserData(
      // id: json['id'],
      name: json['name'], 
      password: json['passowrd'],
      // contact: json['contact'],
      // otp: json['otp'],
      email: json['email'],
    );
    Map<String, dynamic> toJson() => {
      // 'id': id,
      'name': name,
      'password': password,
      // 'contact': contact,
      // 'otp': otp,
      'email': email,
    };
}