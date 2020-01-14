import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_app/models/cuisine.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/services/database_service.dart';
import 'package:zomato_app/widgets/loading_widget.dart';

class RestaurantListScreen extends StatefulWidget {
  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
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
                child:
                    Text("Cuisines", style: Theme.of(context).textTheme.title),
              ),
              _buildCuisineList(),
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
              _buildRestaurantList(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Cuisine>> _buildCuisineList() {
    return FutureBuilder<List<Cuisine>>(
      future: DatabaseService.getCuisines(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingWidget();
        } else {
          List<Cuisine> cuisines = snapshot.data ?? [];

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
        }
      },
    );
  }

  FutureBuilder<List<Restaurant>> _buildRestaurantList() {
    return FutureBuilder<List<Restaurant>>(
      future: DatabaseService.getRestaurants(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingWidget();
        } else {
          List<Restaurant> restaurants = snapshot.data ?? [];

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
        }
      },
    );
  }

  Container _buildRestaurantCell(Restaurant restaurant, BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: restaurant.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => LoadingWidget(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
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
