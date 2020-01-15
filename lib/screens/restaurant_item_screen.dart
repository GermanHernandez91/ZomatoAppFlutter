import 'package:flutter/material.dart';

class RestaurantItemScreen extends StatelessWidget {
  static final String routeName = "restaurant_item_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Item'),
      ),
      body: Center(
        child: Text('Restaurant Item Screen'),
      ),
    );
  }
}
