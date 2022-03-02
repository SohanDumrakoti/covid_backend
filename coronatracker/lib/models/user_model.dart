class UserModel {
  final String? token;
  final String? email;
  final String? password;
  UserModel({
    this.token,
    this.email,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json["token"],
    );
  }
}
