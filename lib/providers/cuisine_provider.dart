import 'package:flutter/material.dart';
import 'package:zomato_app/models/cuisine.dart';
import 'package:zomato_app/services/database_service.dart';

class CuisineProvider with ChangeNotifier {
  List<Cuisine> _cuisines = [];

  List<Cuisine> get allCuisines => _cuisines;

  Future<void> fetchCuisines() async {
    if (_cuisines.isEmpty) {
      final cuisines = await DatabaseService.getCuisines();
      _cuisines = cuisines;
      notifyListeners();
    }
  }
}
