import 'package:ayurved_app/core/screensize/screen_size.dart';
import 'package:ayurved_app/features/patient_management/patient_list/presentation/provider/patient_list_provider.dart';
import 'package:ayurved_app/features/patient_management/patient_registration/presentation/providers/branch_details_provider/branch_details_provider.dart';
import 'package:ayurved_app/features/patient_management/patient_registration/presentation/providers/treatment_list_provider/treatment_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayurved_app/features/auth/data/repositories/login_repository_impl.dart';
import 'package:ayurved_app/features/auth/presentation/provider/login_provider.dart';
import 'package:ayurved_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ayurved_app/features/patient_management/patient_list/presentation/screens/patient_list.dart';

void main() {
  runApp(const MyApp());
}

final screenWidth = ScreenSize.screenWidth;
final screenHeight = ScreenSize.screenHeight;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                LoginProvider(loginRepository: LoginRepositoryImpl())),
        ChangeNotifierProvider(create: (_) => PatientListProvider()),
        ChangeNotifierProvider(create: (_) => BranchDetailsProvider()),
        ChangeNotifierProvider(create: (_) => TreatmentListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/patientList': (context) => const PatientListScreen(),
        },
      ),
    );
  }
}
