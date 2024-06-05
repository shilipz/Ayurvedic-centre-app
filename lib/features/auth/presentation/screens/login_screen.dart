import 'package:ayurved_app/features/auth/presentation/provider/login_provider.dart';
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
                    AuthField(
                      fieldTitle: 'Email',
                      controller: emailController,
                      hintText: 'Enter your email',
                    ),
                    AuthField(
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
                          Navigator.pushReplacementNamed(context, '/home');
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
