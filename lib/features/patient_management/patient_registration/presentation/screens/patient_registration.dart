import 'package:ayurved_app/core/common/widgets/form_field_widgets.dart';
import 'package:ayurved_app/core/constants/space_constants.dart';
import 'package:ayurved_app/core/theme/app_pallete.dart';
import 'package:ayurved_app/core/theme/app_textstyle.dart';
import 'package:ayurved_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ayurved_app/features/auth/presentation/widgets/login_widgets.dart';
import 'package:ayurved_app/features/patient_management/patient_registration/presentation/providers/branch_details_provider/branch_details_provider.dart';
import 'package:ayurved_app/features/patient_management/patient_registration/presentation/providers/treatment_list_provider/treatment_list_provider.dart';
import 'package:ayurved_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayurved_app/features/patient_management/patient_registration/presentation/widgets/patient_reg_screen_widgets/custom_widgets.dart';

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
  void initState() {
    super.initState();
    Provider.of<BranchDetailsProvider>(context, listen: false)
        .fetchBranchDetails();
    Provider.of<TreatmentListProvider>(context, listen: false)
        .fetchTreatmentList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 14, right: 14),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ArrowBack(),
                        Icon(Icons.notifications_on_outlined, size: 28)
                      ])),
              appSpaces.spaceForHeight30,
              Row(children: [
                appSpaces.spaceForWidth20,
                appSpaces.spaceForWidth5,
                Text('Register', style: AppTextStyles.titleLarge)
              ]),
              appSpaces.spaceForHeight10,
              const Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                child: Consumer2<BranchDetailsProvider, TreatmentListProvider>(
                  builder: (context, branchDetailsProvider,
                      treatmentListProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                            controller: nameController,
                            hintText: 'Enter your name',
                            fieldTitle: 'Name'),
                        CustomTextField(
                            controller: whatsappNoController,
                            hintText: 'Enter your Whatsapp number',
                            fieldTitle: 'Whatsapp Number'),
                        CustomTextField(
                            controller: addressController,
                            hintText: 'Enter your Address',
                            fieldTitle: 'Address'),
                        const CustomDropdownColumn(
                          icon: Icons.keyboard_arrow_down_sharp,
                          data: [],
                          hint: 'Choose your Location',
                          title: 'Location',
                        ),
                        CustomDropdownColumn(
                          icon: Icons.keyboard_arrow_down_sharp,
                          data: branchDetailsProvider.branchDetailList
                              .map((branch) => branch.locationName)
                              .toList(),
                          hint: 'Choose your Branch',
                          title: 'Branch',
                        ),
                        appSpaces.spaceForHeight30,
                        Text('Treatments', style: AppTextStyles.fieldTitle),
                        const TreatmentsTile(),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: screenHeight * .6,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomDropdownColumn(
                                            title: 'Choose Treatment',
                                            icon:
                                                Icons.keyboard_arrow_down_sharp,
                                            hint: 'Treatment List',
                                            data: treatmentListProvider
                                                .treatmentList
                                                .map((treatment) =>
                                                    treatment.treatmentName)
                                                .toList()),
                                        appSpaces.spaceForHeight30,
                                        Text('Add Patients',
                                            style: AppTextStyles.fieldTitle),
                                        appSpaces.spaceForHeight10,
                                        const GenderAddingTile(gender: 'Male'),
                                        appSpaces.spaceForHeight30,
                                        const GenderAddingTile(
                                            gender: 'Female'),
                                        appSpaces.spaceForHeight30,
                                        appSpaces.spaceForHeight20,
                                        AuthButton(
                                            buttonText: 'Save',
                                            onPressed: () {})
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child:
                              const TreatmentDropDown(hint: 'Add Treatments'),
                        ),
                        CustomTextField(
                            controller: totalAmtController,
                            fieldTitle: 'Total Amount'),
                        CustomTextField(
                            controller: discountAmtController,
                            fieldTitle: 'Discount Amount'),
                        appSpaces.spaceForHeight30,
                        Text('Payment Option', style: AppTextStyles.fieldTitle),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomRadioButton(option: 'Cash'),
                            CustomRadioButton(option: 'Card'),
                            CustomRadioButton(option: 'UPI')
                          ],
                        ),
                        CustomTextField(
                            controller: advanceAmtController,
                            fieldTitle: 'Advance Amount'),
                        CustomTextField(
                            controller: balanceAmtController,
                            fieldTitle: 'Balance Amount'),
                        const CustomTextField(
                            icon: Icons.calendar_month_outlined,
                            fieldTitle: 'Treatment Date'),
                        const TimeDropDown(),
                        appSpaces.spaceForHeight30,
                        AuthButton(buttonText: 'Save', onPressed: () {})
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
