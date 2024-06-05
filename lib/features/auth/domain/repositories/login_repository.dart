import 'package:ayurved_app/features/auth/data/models/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(String username, String password);
}
