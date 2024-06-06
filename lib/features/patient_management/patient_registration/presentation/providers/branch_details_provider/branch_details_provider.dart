import 'dart:convert';
import 'dart:developer';

import 'package:ayurved_app/core/secrets/app_secrets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BranchDetailsModel {
  final int id;
  final String branchName;
  final String locationName;

  BranchDetailsModel(
      {required this.id, required this.branchName, required this.locationName});

  factory BranchDetailsModel.fromJson(Map<String, dynamic> json) {
    return BranchDetailsModel(
      id: json['id'] as int,
      branchName: json['name'] as String,
      locationName: json['location'] as String,
    );
  }
}

class BranchDetailsProvider extends ChangeNotifier {
  List<BranchDetailsModel> _branchDetailList = [];
  bool _isLoading = false;
  List<BranchDetailsModel> get branchDetailList => _branchDetailList;
  bool get isLoading => _isLoading;

  Future<void> fetchBranchDetails() async {
    _isLoading = true;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(
        Uri.parse(AppUrl.branchListURL),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        log('message');
        final data = jsonDecode(response.body);
        final List<BranchDetailsModel> fetchedData = [];
        for (var branch in data['branches']) {
          fetchedData.add(BranchDetailsModel.fromJson(branch));
        }
        _branchDetailList = fetchedData;
      } else {
        throw Exception('failed to load branch details');
      }
    } catch (error) {
      throw Exception('Failed to load patients: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
