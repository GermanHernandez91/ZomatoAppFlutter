import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_app/models/cuisine.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/services/database_service.dart';
import 'package:zomato_app/widgets/progress_widget.dart';

class RestaurantListScreen extends StatefulWidget {
  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  List<Cuisine> _cuisines = [];
  List<Restaurant> _restaurants = [];
  bool _isLoading = false;

  _getCuisines() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final cuisines = await DatabaseService.getCuisines();

      setState(() {
        _cuisines = cuisines;
      });

      await _getRestaurants();
    } on Exception catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  _getRestaurants() async {
    try {
      final restaurants = await DatabaseService.getRestaurants();

      setState(() {
        _restaurants = restaurants;
        _isLoading = false;
      });
    } on Exception catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCuisines();
  }

  Widget _buildCuisineItem(Cuisine cuisine) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          cuisine.cuisineName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantItem(Restaurant restaurant) {
    return Container(
      height: 200,
      width: 200,
      margin: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          restaurant.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> getChildrenTasks() {
    return _cuisines.map((todo) => _buildCuisineItem(todo)).toList();
  }

  List<Widget> getChildrenRestaurants() {
    return _restaurants.map((todo) => _buildRestaurantItem(todo)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants"),
      ),
      body: ProgressWidget(
        state: _isLoading,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Cuisines',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                height: 120,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: getChildrenTasks(),
                ),
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Most Popular',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  children: getChildrenRestaurants(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
