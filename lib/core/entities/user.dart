class User {
  String? email;
  String? password;
  String? token;
  User({
    this.email,
    this.password,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        email: responseData['email'],
        password: responseData['password'],
        token: responseData['token']);
  }
}
