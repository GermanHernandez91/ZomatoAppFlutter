import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zomato_app/models/cuisine.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/utilities/networking.dart';

class DatabaseService {
  static Future<List<Cuisine>> getCuisines() async {
    final List<Cuisine> cuisines = [];
    final queryParams = await Networking.configureLocation();
    final headers = Networking.configureHeaders();

    final uri = Networking.configureUri("/api/v2.1/cuisines", queryParams);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      final result = Cuisines.fromJson(responseJson);

      result.cuisines.forEach((item) {
        cuisines.add(item.cuisine);
      });

      return cuisines;
    } else {
      throw Exception("Failed fetching cuisines");
    }
  }

  static Future<List<Restaurant>> getRestaurants([int limit]) async {
    final List<Restaurant> restaurants = [];
    var queryParams = await Networking.configureLocation();
    final headers = Networking.configureHeaders();

    if (limit != null) {
      queryParams["count"] = limit.toString();
    }

    final uri = Networking.configureUri("/api/v2.1/collections", queryParams);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      final result = Restaurants.fromJson(responseJson);

      result.collections.forEach((item) {
        restaurants.add(item.collection);
      });

      return restaurants;
    } else {
      throw Exception("Failed getting restaurants");
    }
  }
}
