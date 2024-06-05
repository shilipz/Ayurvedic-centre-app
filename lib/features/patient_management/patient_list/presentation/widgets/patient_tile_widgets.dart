import 'package:flutter/material.dart';
import 'package:ayurved_app/core/constants/space_constants.dart';
import 'package:ayurved_app/core/theme/app_pallete.dart';
import 'package:ayurved_app/core/theme/app_textstyle.dart';

class PatientTile extends StatelessWidget {
  final String patientName;
  final String treatmentName;
  final String date;

  const PatientTile({
    super.key,
    required this.patientName,
    required this.treatmentName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.26,
      width: screenWidth,
      decoration: BoxDecoration(
        color: AppPallete.patientTileColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 14, left: 14),
            child: Row(
              children: [
                appSpaces.spaceForWidth20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PatientName(patientName: patientName),
                    appSpaces.spaceForHeight10,
                    Row(
                      children: [
                        appSpaces.spaceForWidth20,
                        PatientTileTreatmentName(treatmentName: treatmentName),
                      ],
                    ),
                    appSpaces.spaceForHeight15,
                    Row(
                      children: [
                        appSpaces.spaceForWidth20,
                        const Icon(Icons.calendar_month,
                            color: Colors.red, size: 16),
                        appSpaces.spaceForWidth5,
                        Text(date, style: AppTextStyles.patientTileSmall),
                        appSpaces.spaceForWidth20,
                        const Icon(Icons.people, color: Colors.red, size: 16),
                        appSpaces.spaceForWidth5,
                        Text('Jithesh', style: AppTextStyles.patientTileSmall)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding:
                const EdgeInsets.only(left: 55, top: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('View Booking details',
                    style: AppTextStyles.patientTilemedium),
                const Icon(Icons.arrow_forward_ios_outlined,
                    color: AppPallete.appGreencolor)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PatientTileTreatmentName extends StatelessWidget {
  final String treatmentName;

  const PatientTileTreatmentName({
    super.key,
    required this.treatmentName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(treatmentName, style: AppTextStyles.patientTilemediumGreen);
  }
}

class PatientName extends StatelessWidget {
  final String patientName;

  const PatientName({
    super.key,
    required this.patientName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(patientName, style: AppTextStyles.patientTitleFont);
  }
}
