import 'package:ayurved_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static border([Color color = AppPallete.borderColor]) {
    OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 0.85),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
