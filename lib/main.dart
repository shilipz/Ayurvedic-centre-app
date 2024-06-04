import 'package:ayurved_app/core/screensize/screen_size.dart';
import 'package:ayurved_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final screenWidth = ScreenSize.screenWidth;
final screenHeight = ScreenSize.screenHeight;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
