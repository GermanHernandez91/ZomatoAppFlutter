import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/models/category.dart';
import 'package:zomato_app/models/cuisine.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/providers/category_provider.dart';
import 'package:zomato_app/providers/cuisine_provider.dart';
import 'package:zomato_app/providers/restaurant_provider.dart';
import 'package:zomato_app/screens/categories_screen.dart';
import 'package:zomato_app/screens/cuisines_screen.dart';
import 'package:zomato_app/screens/restaurants_screen.dart';
import 'package:zomato_app/widgets/image_widget.dart';
import 'package:zomato_app/widgets/loading_widget.dart';

class RestaurantListScreen extends StatelessWidget {
  _redirectTo(BuildContext context, String redirect) {
    switch (redirect) {
      case "cuisines":
        Navigator.pushNamed(context, CuisinesScreen.routeName);
        break;
      case "restaurants":
        Navigator.pushNamed(context, RestaurantsScreen.routeName);
        break;
      case "categories":
        Navigator.pushNamed(context, CategoriesScreen.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildRowSection(context, "Cuisines", "cuisines"),
              _buildCuisineList(context),
              SizedBox(height: 20),
              _buildRowSection(context, "Most Popular", "restaurants"),
              _buildRestaurantList(context),
              SizedBox(height: 20),
              _buildRowSection(context, "Categories", "categories"),
              _buildCategoryList(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildRowSection(
      BuildContext context, String title, String redirect) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.title),
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.green,
            ),
            onPressed: () => _redirectTo(context, redirect),
          ),
        ],
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
          .fetchRestaurants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else {
          return Consumer<RestaurantProvider>(
            builder: (context, model, child) {
              List<Restaurant> restaurants = model.allRestaurants;

              return Container(
                height: 260,
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

  FutureBuilder _buildCategoryList(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CategoryProvider>(context, listen: false)
          .fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else {
          return Consumer<CategoryProvider>(
            builder: (context, model, child) {
              List<Category> categories = model.allCategories;

              return Container(
                height: 160,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    Category category = categories[index];
                    return _buildCategoryCell(category, context);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildRestaurantCell(Restaurant restaurant, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 300,
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageWidget(imageUrl: restaurant.imageUrl),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(restaurant.title, style: Theme.of(context).textTheme.subtitle),
        SizedBox(height: 10),
        Container(
          width: 300,
          child: Text(
            restaurant.description,
            style: Theme.of(context).textTheme.body1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget _buildCuisineCell(Cuisine cuisine, BuildContext context) {
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

  Container _buildCategoryCell(Category category, BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.cover,
          )),
      child: Center(
        child: Text(
          category.name,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }
}
