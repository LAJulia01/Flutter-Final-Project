class UserData {
  // final String id;
  final String fullname;
  final String age;
  final String gender;
  final String address;
  final String name;
  final String password;
  // final String contact;
  // final String otp;
  final String email;
  

  UserData({
    // required this.id,
    required this.fullname, 
    required this.age, 
    required this.gender, 
    required this.address, 
    required this.name, 
    required this.password, 
    // required this.contact,
    // required this.otp, 
    required this.email,
  });

  static UserData fromJson(Map<String, dynamic> json) => UserData(
      // id: json['id'],
      fullname: json['fullname'],
      age: json['age'],
      gender: json['gender'],
      address: json['address'],
      name: json['name'], 
      password: json['passowrd'],
      // contact: json['contact'],
      // otp: json['otp'],
      email: json['email'],
    );
    Map<String, dynamic> toJson() => {
      // 'id': id,
      'fullname': fullname,
      'age': age,
      'gender': gender,
      'address': address,
      'name': name,
      'password': password,
      // 'contact': contact,
      // 'otp': otp,
      'email': email,
    };
}