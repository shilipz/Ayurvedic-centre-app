import 'dart:developer';

import 'package:ayurved_app/features/auth/data/repositories/login_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepositoryImpl loginRepository;

  LoginProvider({required this.loginRepository});

  bool _isLoading = false;
  String? _token;

  bool get isLoading => _isLoading;
  String? get token => _token;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final loginResponse = await loginRepository.login(username, password);
      if (loginResponse.status) {
        _token = loginResponse.token;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token ?? '');

        notifyListeners();
      } else {
        throw Exception(loginResponse.message);
      }
    } catch (error) {
      log('Login error: $error');
      throw Exception('Login failed: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
