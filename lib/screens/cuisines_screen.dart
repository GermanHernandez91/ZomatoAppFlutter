import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/models/cuisine.dart';
import 'package:zomato_app/providers/cuisine_provider.dart';
import 'package:zomato_app/screens/search/restaurants_cuisine_screen.dart';

class CuisinesScreen extends StatelessWidget {
  static final String routeName = "cuisines_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuisines'),
      ),
      body: Consumer<CuisineProvider>(
        builder: (context, model, child) {
          List<Cuisine> cuisines = model.allCuisines;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
            ),
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            scrollDirection: Axis.vertical,
            itemCount: cuisines.length,
            itemBuilder: (context, index) {
              Cuisine cuisine = cuisines[index];
              return InkWell(
                onTap: () {
                  Provider.of<CuisineProvider>(context, listen: false)
                      .setCuisine(cuisine);
                  Navigator.pushNamed(
                    context,
                    RestaurantsCuisineScreen.routeName,
                  );
                },
                child: GridTile(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover,
                        )),
                    child: Center(
                      child: Text(
                        cuisine.cuisineName,
                        style: Theme.of(context).textTheme.headline,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
