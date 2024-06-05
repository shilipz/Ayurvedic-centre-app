class LoginResponse {
  final bool status;
  final String message;
  final String? token;

  LoginResponse({
    required this.status,
    required this.message,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      token: json['token'] as String?, // Handle token as nullable
    );
  }
}
