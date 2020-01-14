import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zomato_app/models/cuisine.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/utilities/constants.dart';

class DatabaseService {
  static Future<List<Cuisine>> getCuisines() async {
    final List<Cuisine> cuisines = [];

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final queryParams = {
      "lat": prefs.getString("lat"),
      "lon": prefs.getString("lon"),
    };

    final uri = Uri.https(Constants.baseURL, "/api/v2.1/cuisines", queryParams);
    final response = await http.get(uri, headers: {
      "user-key": Constants.apiKey,
    });

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      final result = Cuisines.fromJson(responseJson);

      result.cuisines.forEach((item) {
        cuisines.add(item.cuisine);
      });

      return cuisines;
    } else {
      throw Exception("Failed getting cuisines");
    }
  }

  static Future<List<Restaurant>> getRestaurants() async {
    final List<Restaurant> restaurants = [];

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final queryParams = {
      "lat": prefs.getString("lat"),
      "lon": prefs.getString("lon"),
    };

    final uri =
        Uri.https(Constants.baseURL, "/api/v2.1/collections", queryParams);
    final response = await http.get(uri, headers: {
      "user-key": Constants.apiKey,
    });

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
