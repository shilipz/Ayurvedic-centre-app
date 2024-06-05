import 'package:ayurved_app/core/theme/app_pallete.dart';
import 'package:ayurved_app/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  const SearchField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppPallete.greyColor,
          ),
          hintText: 'Search for treatments',
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
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'enter w';
        //   }
        //   return null;
        // },
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppPallete.appGreencolor),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppPallete.transparentColor,
            shadowColor: AppPallete.transparentColor,
          ),
          onPressed: () {},
          child: Text('Search', style: AppTextStyles.buttonText)),
    );
  }
}
