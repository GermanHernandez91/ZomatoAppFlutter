import 'package:flutter/material.dart';
import 'package:zomato_app/models/cuisine.dart';
import 'package:zomato_app/models/restaurant_item.dart';
import 'package:zomato_app/services/database_service.dart';

class CuisineProvider with ChangeNotifier {
  List<Cuisine> _cuisines = [];
  List<RestaurantRestaurant> _restaurants = [];
  Cuisine _cuisine;

  List<Cuisine> get allCuisines => _cuisines;
  List<RestaurantRestaurant> get allRestaurants => _restaurants;
  Cuisine get cuisine => _cuisine;

  void setCuisine(Cuisine cuisine) {
    _cuisine = cuisine;
    notifyListeners();
  }

  Future<void> fetchCuisines() async {
    if (_cuisines.isEmpty) {
      final cuisines = await DatabaseService.getCuisines();
      _cuisines = cuisines;
      notifyListeners();
    }
  }

  Future<void> fetchRestaurantsByCuisine(String cuisineName) async {
    var parameters = {
      "cuisine": cuisineName,
    };

    final restaurants = await DatabaseService.findRestaurantsBy(parameters);
    _restaurants = restaurants;
    notifyListeners();
  }
}
