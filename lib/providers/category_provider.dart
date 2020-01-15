import 'package:flutter/material.dart';
import 'package:zomato_app/models/category.dart';
import 'package:zomato_app/services/database_service.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get allCategories => _categories;

  Future<void> fetchCategories() async {
    if (_categories.isEmpty) {
      final categories = await DatabaseService.getCategories();
      _categories = categories;
      notifyListeners();
    }
  }
}
