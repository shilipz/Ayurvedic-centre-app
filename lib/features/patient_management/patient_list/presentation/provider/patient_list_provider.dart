import 'dart:convert';
import 'package:ayurved_app/core/secrets/app_secrets.dart';
import 'package:ayurved_app/features/patient_management/patient_list/data/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PatientListProvider with ChangeNotifier {
  List<Patient> _patients = [];
  bool _isLoading = false;

  List<Patient> get patients => _patients;
  bool get isLoading => _isLoading;

  Future<void> fetchPatients() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      final response = await http.get(
        Uri.parse(AppUrl.patientListURL),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Patient> loadedPatients = [];
        for (var patient in data['patient']) {
          loadedPatients.add(Patient.fromJson(patient));
        }
        _patients = loadedPatients;
      } else {
        throw Exception('Failed to load patients');
      }
    } catch (error) {
      throw Exception('Failed to load patients: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
