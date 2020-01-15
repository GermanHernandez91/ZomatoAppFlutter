import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/models/restaurant_item.dart';
import 'package:zomato_app/providers/cuisine_provider.dart';
import 'package:zomato_app/widgets/image_widget.dart';
import 'package:zomato_app/widgets/loading_widget.dart';

class RestaurantsCuisineScreen extends StatelessWidget {
  static final String routeName = "restaurants_cuisine_screen";

  @override
  Widget build(BuildContext context) {
    final cuisine = Provider.of<CuisineProvider>(context).cuisine;

    return Scaffold(
      appBar: AppBar(
        title: Text(cuisine.cuisineName),
      ),
      body: FutureBuilder(
        future: Provider.of<CuisineProvider>(context, listen: false)
            .fetchRestaurantsByCuisine(cuisine.cuisineName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget();
          } else {
            return Consumer<CuisineProvider>(
              builder: (context, model, child) {
                List<RestaurantRestaurant> restaurants = model.allRestaurants;

                return Container(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      RestaurantRestaurant restaurant = restaurants[index];
                      return ImageWidget(
                        imageUrl: restaurant.featuredImage,
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
