import 'package:flutter/material.dart';
import 'package:zomato_app/models/restaurant.dart';
import 'package:zomato_app/screens/restaurant_item_screen.dart';
import 'package:zomato_app/widgets/image_widget.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RestaurantItemScreen.routeName);
      },
      child: Card(
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
      ),
    );
  }
}
