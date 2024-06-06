// ignore_for_file: use_build_context_synchronously

import 'package:ayurved_app/features/auth/presentation/provider/login_provider.dart';
import 'package:ayurved_app/features/patient_management/patient_list/presentation/screens/patient_list.dart';
import 'package:flutter/material.dart';
import 'package:ayurved_app/core/constants/space_constants.dart';
import 'package:ayurved_app/core/theme/app_textstyle.dart';
import 'package:ayurved_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ayurved_app/features/auth/presentation/widgets/login_widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LoginImg(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const LoginCaption(),
                    CustomTextField(
                      fieldTitle: 'Email',
                      controller: emailController,
                      hintText: 'Enter your email',
                    ),
                    CustomTextField(
                      fieldTitle: 'Password',
                      controller: passwordController,
                      hintText: 'Enter password',
                    ),
                    appSpaces.spaceForHeight30,
                    AuthButton(
                      buttonText: 'Login',
                      onPressed: () async {
                        try {
                          await loginProvider.login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PatientListScreen()),
                            (route) => false,
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
                      },
                    ),
                    appSpaces.spaceForHeight30,
                    Text(
                      'By creating or logging into an account you are agreeing with our Terms and Conditions and Privacy Policy.',
                      style: AppTextStyles.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
