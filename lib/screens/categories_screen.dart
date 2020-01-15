import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/models/category.dart';
import 'package:zomato_app/providers/category_provider.dart';

class CategoriesScreen extends StatelessWidget {
  static final String routeName = "categories_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, model, child) {
          List<Category> categories = model.allCategories;

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
            itemCount: categories.length,
            itemBuilder: (context, index) {
              Category category = categories[index];
              return GridTile(
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
                      category.name,
                      style: Theme.of(context).textTheme.headline,
                      maxLines: 3,
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
