import 'package:ayurved_app/core/entities/user.dart';
import 'package:ayurved_app/core/secrets/app_secrets.dart';
import 'package:ayurved_app/features/auth/data/repositories/login_repository_impl.dart';
import 'package:ayurved_app/features/auth/presentation/provider/login_provider.dart';
import 'package:ayurved_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ayurved_app/features/patient_management/presentation/screens/patient_list.dart';
import 'package:flutter/material.dart';
import 'package:ayurved_app/core/screensize/screen_size.dart';
import 'package:ayurved_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(
            loginRepository: LoginRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/home': (context) => const PatientListScreen()
        },
      ),
    );
  }
}
