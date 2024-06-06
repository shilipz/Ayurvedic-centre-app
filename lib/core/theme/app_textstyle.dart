import 'package:ayurved_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle baseStyle = GoogleFonts.poppins();

  static final TextStyle titleLarge = baseStyle.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppPallete.loginCaptionColor);

  static final TextStyle patientTitleFont = baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle patientTilemediumGreen = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: AppPallete.appGreencolor);

  static final TextStyle patientTilemedium = baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle patientTileSmall = baseStyle.copyWith(
      fontSize: 15, fontWeight: FontWeight.w400, color: AppPallete.greyColor);

  static final TextStyle fieldTitle = baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle fieldTitleGreen = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppPallete.appGreencolor);

  static final TextStyle hintText = baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle bodyLarge = baseStyle.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle buttonText = baseStyle.copyWith(
      fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white);

  static final TextStyle bodySmall = baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
}
