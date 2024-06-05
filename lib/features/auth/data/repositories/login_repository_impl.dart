import 'dart:convert';
import 'dart:developer';
import 'package:ayurved_app/core/secrets/app_secrets.dart';
import 'package:ayurved_app/features/auth/data/models/login_response.dart';
import 'package:ayurved_app/features/auth/domain/repositories/login_repository.dart';
import 'package:http/http.dart' as http;

class LoginRepositoryImpl implements LoginRepository {
  final String apiUrl = AppUrl.login;

  @override
  Future<LoginResponse> login(String username, String password) async {
    var uri = Uri.parse(apiUrl);
    var request = http.MultipartRequest('POST', uri)
      ..fields['username'] = username
      ..fields['password'] = password;

    try {
      var response = await request.send();

      log('Response status: ${response.statusCode}');

      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonResponse);
      } else {
        throw Exception(
            'Failed to login. Server responded with status code: ${response.statusCode}');
      }
    } catch (error) {
      log('Error: $error');
      throw Exception('Failed to login. Error: $error');
    }
  }
}
