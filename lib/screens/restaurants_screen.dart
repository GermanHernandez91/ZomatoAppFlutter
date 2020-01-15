import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/providers/restaurant_provider.dart';
import 'package:zomato_app/widgets/image_widget.dart';

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

          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: ImageWidget(imageUrl: restaurant.imageUrl),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        restaurant.title,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      SizedBox(height: 5),
                      Text(
                        restaurant.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
