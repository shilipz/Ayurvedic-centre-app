import 'dart:convert';

import 'package:ayurved_app/core/secrets/app_secrets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TreatmentListModel {
  final int id;
  final String treatmentName;

  TreatmentListModel({required this.id, required this.treatmentName});

  factory TreatmentListModel.fromJson(Map<String, dynamic> json) {
    return TreatmentListModel(
        id: json['id'] as int, treatmentName: json['name'] as String);
  }
}

class TreatmentListProvider extends ChangeNotifier {
  List<TreatmentListModel> _treatmentList = [];
  bool _isLoading = false;
  bool _hasTreatmentTime = false;

  List<TreatmentListModel> get treatmentList => _treatmentList;
  bool get isLoading => _isLoading;
  bool get hasTreatmentTime => _hasTreatmentTime;

  // Use ValueNotifier for counts
  final ValueNotifier<int> _maleCount = ValueNotifier<int>(1);
  final ValueNotifier<int> _femaleCount = ValueNotifier<int>(1);

  ValueNotifier<int> get maleCount => _maleCount;
  ValueNotifier<int> get femaleCount => _femaleCount;

  void incrementMaleCount() {
    _maleCount.value++;
  }

  void decrementMaleCount() {
    if (_maleCount.value > 0) {
      _maleCount.value--;
    }
  }

  void incrementFemaleCount() {
    _femaleCount.value++;
  }

  void decrementFemaleCount() {
    if (_femaleCount.value > 0) {
      _femaleCount.value--;
    }
  }

  void updateMalecount() {
    notifyListeners();

    maleCount;
  }

  Future<void> fetchTreatmentList() async {
    _isLoading = true;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(
        Uri.parse(AppUrl.treatmentListURL),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<TreatmentListModel> fetchedTreatmentList = [];
        for (var treatment in data['treatments']) {
          fetchedTreatmentList.add(TreatmentListModel.fromJson(treatment));
        }
        _treatmentList = fetchedTreatmentList;
      } else {
        throw Exception('Failed to load treatments list');
      }
    } catch (e) {
      throw Exception('Failed to load Treatment list: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
