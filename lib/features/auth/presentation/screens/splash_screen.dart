import 'dart:async';
import 'dart:ui';

import 'package:ayurved_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ayurved_app/features/patient_management/patient_list/presentation/screens/patient_list.dart';
import 'package:ayurved_app/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Timer(const Duration(seconds: 5), () {
      if (token != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const PatientListScreen(),
        ));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Image(
            height: screenHeight,
            image: const AssetImage('assets/splash_screen_img.jpeg'),
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                color: const Color.fromRGBO(2, 20, 0, 0.6),
              ),
            ),
          ),
          Center(
            child: Image(
                height: screenHeight * 0.2,
                width: screenWidth * 0.25,
                image: const AssetImage('assets/ayurved_logo.png')),
          )
        ],
      )),
    );
  }
}
