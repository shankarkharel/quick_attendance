class Student {
  String roll;
  String name;
  String email;
  String phone;
  String password;

  Student(
      {required this.roll,
      required this.name,
      required this.email,
      required this.phone,
      required this.password});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      roll: json['roll'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );
  }
}
