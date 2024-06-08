// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ayurved_app/features/patient_management/patient_registration/presentation/providers/patient_registration_provider/patient_reg_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:ayurved_app/core/constants/space_constants.dart';
import 'package:ayurved_app/core/theme/app_pallete.dart';
import 'package:ayurved_app/core/theme/app_textstyle.dart';
import 'package:ayurved_app/features/patient_management/patient_registration/presentation/providers/branch_details_provider/branch_details_provider.dart';
import 'package:ayurved_app/main.dart';

class CustomDropdownColumn extends StatelessWidget {
  final String? value;
  final IconData? icon;
  final String? title;
  final String hint;
  final List<String> data;
  final ValueChanged<String?>? onChanged;

  const CustomDropdownColumn(
      {super.key,
      this.title,
      required this.hint,
      required this.data,
      this.icon,
      this.value,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appSpaces.spaceForHeight30,
        Text(title ?? '', style: AppTextStyles.fieldTitle),
        appSpaces.spaceForHeight6,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppPallete.borderColor),
            color: AppPallete.patientTileColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: screenWidth,
          height: screenHeight * 0.08,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Consumer<BranchDetailsProvider>(
                    builder: (context, branchDetailsProvider, child) {
                      return DropdownButton<String>(
                          isExpanded: true,
                          value: null,
                          hint: Text(
                            value ?? hint,
                            style: AppTextStyles.hintText,
                          ),
                          items: data
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          iconDisabledColor: Colors.transparent,
                          iconEnabledColor: Colors.transparent,
                          underline: const SizedBox(),
                          onChanged: onChanged);
                    },
                  ),
                ),
                Icon(
                  icon,
                  size: 30,
                  color: AppPallete.appGreencolor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final String option;
  const CustomRadioButton({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientRegistrationProvider>(
      builder: (context, patientRegistrationProvider, child) {
        return RadioMenuButton<String>(
          value: option,
          groupValue: patientRegistrationProvider.selectedPaymentOption,
          onChanged: (String? value) {
            if (value != null) {
              patientRegistrationProvider.updatePaymentOption(value);
            }
          },
          child: Text(
            option,
            style: AppTextStyles.fieldTitle,
          ),
        );
      },
    );
  }
}

class TreatmentDropDown extends StatelessWidget {
  final String? title;
  final String hint;
  const TreatmentDropDown({
    super.key,
    this.title,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? '', style: AppTextStyles.fieldTitle),
        appSpaces.spaceForHeight6,
        Container(
          decoration: BoxDecoration(
            color: AppPallete.lightGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          width: screenWidth,
          height: screenHeight * 0.08,
          child: Center(
              child: Text(
            '+ Add Treatments',
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          )),
        ),
      ],
    );
  }
}

class GenderAddingTile extends StatelessWidget {
  final String gender;
  final ValueNotifier<int> countNotifier;

  final VoidCallback? onPressed;
  final VoidCallback? onDecrement;

  const GenderAddingTile({
    super.key,
    required this.gender,
    this.onPressed,
    this.onDecrement,
    required this.countNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: screenHeight * 0.07,
          width: screenWidth / 3.75,
          decoration: BoxDecoration(
              border: Border.all(color: AppPallete.borderColor),
              borderRadius: BorderRadius.circular(8),
              color: AppPallete.patientTileColor),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(gender),
          ),
        ),
        appSpaces.spaceForWidth20,
        appSpaces.spaceForWidth10,
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 40,
                height: 40,
                color: AppPallete.appGreencolor,
                child: IconButton(
                  onPressed: onDecrement,
                  icon: const Icon(
                    Icons.remove,
                    color: AppPallete.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        appSpaces.spaceForWidth5,
        Container(
          height: screenHeight * 0.07,
          width: screenWidth / 8.5,
          decoration: BoxDecoration(
            border: Border.all(color: AppPallete.borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: ValueListenableBuilder<int>(
                valueListenable: countNotifier,
                builder: (context, count, child) {
                  return Text(
                    count.toString(),
                  );
                },
              ),
            ),
          ),
        ),
        appSpaces.spaceForWidth5,
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 40,
                height: 40,
                color: AppPallete.appGreencolor,
                child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.add,
                    color: AppPallete.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TreatmentsTile extends StatelessWidget {
  final Map<String, dynamic> treatment;
  final VoidCallback onRemove;

  const TreatmentsTile({
    required this.treatment,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallete.borderColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appSpaces.spaceForWidth20,
                Expanded(
                  child: Text(
                    '${treatment['treatmentName']}',
                    style: AppTextStyles.patientTitleFont,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: onRemove,
                ),
              ],
            ),
            appSpaces.spaceForHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Male',
                  style: AppTextStyles.fieldTitleGreen,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 2),
                  ),
                  height: 36,
                  width: 44,
                  child: Center(
                    child: Text(
                      '${treatment['maleCount']}',
                      style: AppTextStyles.fieldTitle,
                    ),
                  ),
                ),
                Text(
                  'Female',
                  style: AppTextStyles.fieldTitleGreen,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 2),
                  ),
                  height: 36,
                  width: 44,
                  child: Center(
                    child: Text(
                      '${treatment['femaleCount']}',
                      style: AppTextStyles.fieldTitle,
                    ),
                  ),
                ),
                const Icon(
                  Icons.edit,
                  color: AppPallete.appGreencolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimeDropDown extends StatelessWidget {
  const TimeDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: screenWidth / 2.25,
          child: const CustomDropdownColumn(
            title: 'Treatment Time',
            hint: 'Hour',
            icon: Icons.keyboard_arrow_down_sharp,
            data: [],
          ),
        ),
        SizedBox(
          width: screenWidth / 2.25,
          child: const CustomDropdownColumn(
            hint: 'Minutes',
            icon: Icons.keyboard_arrow_down_sharp,
            data: [],
          ),
        ),
      ],
    );
  }
}
