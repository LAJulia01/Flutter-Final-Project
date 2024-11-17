class Employee {
  final String id;
  final String name;
  final String email;

  Employee({
    required this.id,
    required this.name, 
    required this.email,
  });

  static Employee fromJson(Map<String, dynamic> json) => Employee(
      id: json['id'],
      name: json['name'], 
      email: json['email'],
    );
    Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'email': email,
    };
}
