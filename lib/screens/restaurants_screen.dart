import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/providers/restaurant_provider.dart';
import 'package:zomato_app/widgets/restaurant_card_widget.dart';

class RestaurantsScreen extends StatelessWidget {
  static final String routeName = "restaurants_screen";

  @override
  Widget build(BuildContext context) {
    final restaurants = Provider.of<RestaurantProvider>(context).allRestaurants;

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          Restaurant restaurant = restaurants[index];

          return RestaurantCardWidget(restaurant: restaurant);
        },
      ),
    );
  }
}
