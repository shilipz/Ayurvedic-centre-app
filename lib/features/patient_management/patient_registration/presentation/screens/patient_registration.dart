import 'package:ayurved_app/core/constants/space_constants.dart';
import 'package:ayurved_app/core/theme/app_textstyle.dart';
import 'package:ayurved_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ayurved_app/features/auth/presentation/widgets/login_widgets.dart';
import 'package:flutter/material.dart';

class PatientRegistrationScreen extends StatefulWidget {
  const PatientRegistrationScreen({super.key});

  @override
  State<PatientRegistrationScreen> createState() =>
      _PatientRegistrationScreenState();
}

final nameController = TextEditingController();
final whatsappNoController = TextEditingController();
final addressController = TextEditingController();
final locationController = TextEditingController();
final branchController = TextEditingController();
final totalAmtController = TextEditingController();
final discountAmtController = TextEditingController();
final advanceAmtController = TextEditingController();
final balanceAmtController = TextEditingController();

class _PatientRegistrationScreenState extends State<PatientRegistrationScreen> {
  @override
  void dispose() {
    nameController.dispose();
    whatsappNoController.dispose();
    addressController.dispose();
    locationController.dispose();
    branchController.dispose();
    totalAmtController.dispose();
    discountAmtController.dispose();
    advanceAmtController.dispose();
    balanceAmtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 14,
                  right: 14,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back, size: 28)),
                      const Icon(Icons.notifications_on_outlined, size: 28)
                    ]),
              ),
              appSpaces.spaceForHeight30,
              Row(
                children: [
                  appSpaces.spaceForWidth20,
                  appSpaces.spaceForWidth5,
                  Text('Register', style: AppTextStyles.titleLarge),
                ],
              ),
              appSpaces.spaceForHeight10,
              const Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                child: Column(
                  children: [
                    AuthField(
                        controller: nameController,
                        hintText: 'Enter your name',
                        fieldTitle: 'Name'),
                    AuthField(
                        controller: whatsappNoController,
                        hintText: 'Enter your Whatsapp number',
                        fieldTitle: 'Whatsapp Number'),
                    AuthField(
                        controller: addressController,
                        hintText: 'Enter your Address',
                        fieldTitle: 'Address'),
                    AuthField(
                        controller: locationController,
                        hintText: 'Choose your Location',
                        fieldTitle: 'Location'),
                    AuthField(
                        controller: nameController,
                        hintText: 'Select the branch',
                        fieldTitle: 'Branch'),
                    AuthField(
                        controller: totalAmtController,
                        fieldTitle: 'Total Amount'),
                    AuthField(
                        controller: discountAmtController,
                        fieldTitle: 'Discount Amount'),
                    AuthField(
                        controller: advanceAmtController,
                        fieldTitle: 'Advance Amount'),
                    AuthField(
                        controller: balanceAmtController,
                        fieldTitle: 'Balance Amount'),
                    appSpaces.spaceForHeight30,
                    AuthButton(buttonText: 'Save', onPressed: () {})
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
