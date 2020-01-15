import 'package:flutter/material.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/services/database_service.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [];

  List<Restaurant> get allRestaurants => _restaurants;

  Future<void> fetchRestaurants([int limit]) async {
    final restaurants = await DatabaseService.getRestaurants(limit);
    _restaurants = restaurants;
    notifyListeners();
  }
}
