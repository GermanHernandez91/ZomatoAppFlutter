import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(bool isLoading) => _isLoading = isLoading;
}
