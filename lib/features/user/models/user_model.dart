class UserModel {
  final String firstName;
  final String lastName;
  final String middleName;
  final String role;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      middleName: json['middle_name'] ?? '',
      role: json['role'] ?? '',
    );
  }

  String get fullName => '$firstName $lastName'.trim();
}
