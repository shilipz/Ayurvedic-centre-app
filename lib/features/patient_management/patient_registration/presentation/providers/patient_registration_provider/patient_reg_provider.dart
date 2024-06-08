import 'dart:convert';
import 'dart:developer';

import 'package:ayurved_app/core/secrets/app_secrets.dart';
import 'package:ayurved_app/features/patient_management/patient_registration/data/models/patient_reg_model/patient_reg_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PatientRegistrationProvider with ChangeNotifier {
  String? selectedLocation;
  String? selectedBranch;
  String? selectedTreatment;
  bool isLoading = false;
  List<Map<String, dynamic>> addedTreatments = [];
  String _selectedPaymentOption = 'Cash';

  String get selectedPaymentOption => _selectedPaymentOption;

  void updatePaymentOption(String? option) {
    if (option != null) {
      _selectedPaymentOption = option;
      notifyListeners();
    }
  }

  void updateLocation(String? location) {
    selectedLocation = location;
    notifyListeners();
  }

  void updateBranch(String? branch) {
    selectedBranch = branch;
    notifyListeners();
  }

  void updateTreatment(String? treatment) {
    selectedTreatment = treatment;
    notifyListeners();
  }

  void addTreatment(Map<String, dynamic> treatment) {
    addedTreatments.add(treatment);
    notifyListeners();
  }

  void removeTreatment(int index) {
    addedTreatments.removeAt(index);
    notifyListeners();
  }

  Future<void> registerPatient(PatientRegistration registration) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var uri = Uri.parse(AppUrl.patientRegister);

    if (token == null) {
      throw Exception('Token not found');
    }

    var request = http.MultipartRequest('POST', uri)
      ..fields.addAll(registration.toMap())
      ..headers['Authorization'] = 'Bearer $token';

    log('Request headers: ${request.headers}');
    log('Request fields: ${json.encode(request.fields)}');

    try {
      isLoading = true;
      notifyListeners();

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      log('Response status code: ${response.statusCode}');
      log('Response body: $responseBody');

      isLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(responseBody);
        log('Patient registered successfully: $jsonResponse');
      } else {
        log('Failed to register patient. Server responded with status code: ${response.statusCode}');
        log('Response body: $responseBody');
      }
    } catch (error) {
      isLoading = false;
      notifyListeners();
      log('Failed to register patient. Error: $error');
    }
  }
}
