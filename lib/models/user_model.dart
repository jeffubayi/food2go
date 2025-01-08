class UserModel {
  final String id;
  final String email;
  final String? fullName;
  final String? phoneNumber;

  UserModel({
    required this.id,
    required this.email,
    this.fullName,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
    );
  }
}
