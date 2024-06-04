import 'package:ayurved_app/core/theme/app_pallete.dart';
import 'package:ayurved_app/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AuthButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppPallete.appGreencolor),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppPallete.transparentColor,
              shadowColor: AppPallete.transparentColor,
              fixedSize: const Size(395, 55)),
          onPressed: onPressed,
          child: Text(buttonText, style: AppTextStyles.buttonText)),
    );
  }
}
