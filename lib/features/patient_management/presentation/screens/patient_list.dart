import 'package:ayurved_app/core/constants/space_constants.dart';
import 'package:ayurved_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ayurved_app/features/patient_management/presentation/screens/patient_registration.dart';
import 'package:ayurved_app/features/patient_management/presentation/widgets/patient_list_screen_widgets/patient_tile_widgets.dart';
import 'package:ayurved_app/features/patient_management/presentation/widgets/patient_list_screen_widgets/search_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

final searchController = TextEditingController();

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 14, right: 14),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.arrow_back, size: 28)),
                            const Icon(Icons.notifications_on_outlined,
                                size: 28)
                          ]),
                      appSpaces.spaceForHeight30,
                      Row(children: [
                        Expanded(
                            child: SearchField(controller: searchController)),
                        appSpaces.spaceForWidth10,
                        const SearchButton()
                      ]),
                      appSpaces.spaceForHeight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sort by:',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16)),
                          ),
                          DropdownButton(
                              hint: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Date'),
                                    Icon(Icons.keyboard_arrow_down_sharp)
                                  ]),
                              items: const [],
                              onChanged: (value) {})
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const PatientTile(),
                            appSpaces.spaceForHeight20
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: AuthButton(
                    buttonText: 'Register Now',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const PatientRegistrationScreen()));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
