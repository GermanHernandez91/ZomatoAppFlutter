import 'package:meta/meta.dart';

class Categories {
  final List<CategoryElement> categories;

  Categories({
    @required this.categories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categories: List<CategoryElement>.from(
            json["categories"].map((x) => CategoryElement.fromJson(x))),
      );
}

class CategoryElement {
  final Category category;

  CategoryElement({
    @required this.category,
  });

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        category: Category.fromJson(json["categories"]),
      );
}

class Category {
  final int id;
  final String name;

  Category({
    @required this.id,
    @required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );
}
