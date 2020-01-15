import 'package:flutter/material.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/services/database_service.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [];
  Restaurant _restaurantSelected;

  List<Restaurant> get allRestaurants => _restaurants;
  Restaurant get restaurantSelected => _restaurantSelected;

  Future<void> fetchRestaurants([int limit]) async {
    if (_restaurants.isEmpty) {
      final restaurants = await DatabaseService.getRestaurants(limit);
      _restaurants = restaurants;
      notifyListeners();
    }
  }
}
