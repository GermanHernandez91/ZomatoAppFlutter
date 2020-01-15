import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/models/cuisine.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/providers/cuisine_provider.dart';
import 'package:zomato_app/providers/restaurant_provider.dart';
import 'package:zomato_app/widgets/image_widget.dart';
import 'package:zomato_app/widgets/loading_widget.dart';

class RestaurantListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Cuisines",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              _buildCuisineList(context),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Most Popular",
                        style: Theme.of(context).textTheme.title),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              _buildRestaurantList(context),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder _buildCuisineList(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<CuisineProvider>(context, listen: false).fetchCuisines(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else {
          return Consumer<CuisineProvider>(
            builder: (context, model, child) {
              List<Cuisine> cuisines = model.allCuisines;

              return Container(
                height: 140,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: cuisines.length,
                  itemBuilder: (context, index) {
                    Cuisine cuisine = cuisines[index];
                    return _buildCuisineCell(cuisine, context);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  FutureBuilder _buildRestaurantList(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<RestaurantProvider>(context, listen: false)
          .fetchRestaurants(6),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else {
          return Consumer<RestaurantProvider>(
            builder: (context, model, child) {
              List<Restaurant> restaurants = model.allRestaurants;

              return Container(
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    Restaurant restaurant = restaurants[index];
                    return _buildRestaurantCell(restaurant, context);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  Container _buildRestaurantCell(Restaurant restaurant, BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ImageWidget(imageUrl: restaurant.imageUrl),
      ),
    );
  }

  Container _buildCuisineCell(Cuisine cuisine, BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          cuisine.cuisineName,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
