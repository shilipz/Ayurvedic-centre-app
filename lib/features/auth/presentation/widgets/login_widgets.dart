import 'package:ayurved_app/core/constants/space_constants.dart';
import 'package:ayurved_app/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:ayurved_app/core/theme/app_pallete.dart';

class LoginImg extends StatelessWidget {
  const LoginImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          height: screenHeight * 0.25,
          width: screenWidth,
          image: const AssetImage("assets/splash_screen_img3.jpeg"),
          fit: BoxFit.fill,
        ),
        Center(
          child: Image(
              height: screenHeight * 0.1,
              width: screenWidth * 0.3,
              image: const AssetImage("assets/ayurved_logo.png")),
        )
      ],
    );
  }
}

class LoginCaption extends StatelessWidget {
  const LoginCaption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Login Or Register To Book Your Appointments',
        textAlign: TextAlign.left, style: AppTextStyles.titleLarge);
  }
}

class AuthField extends StatelessWidget {
  final String fieldTitle;
  final bool isObscureText;
  final String? hintText;
  final TextEditingController controller;

  const AuthField({
    super.key,
    required this.controller,
    this.isObscureText = false,
    this.hintText,
    required this.fieldTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appSpaces.spaceForHeight30,
        Text(fieldTitle, style: AppTextStyles.fieldTitle),
        appSpaces.spaceForHeight6,
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppPallete.borderColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppPallete.borderColor, width: 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          controller: controller,
          obscureText: isObscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$hintText is missing';
            }
            return null;
          },
        ),
      ],
    );
  }
}
