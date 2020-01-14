import 'package:meta/meta.dart';

class Restaurants {
  final List<RestaurantElement> collections;

  Restaurants({
    @required this.collections,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        collections: List<RestaurantElement>.from(
            json["collections"].map((x) => RestaurantElement.fromJson(x))),
      );
}

class RestaurantElement {
  final Restaurant collection;

  RestaurantElement({
    @required this.collection,
  });

  factory RestaurantElement.fromJson(Map<String, dynamic> json) =>
      RestaurantElement(
        collection: Restaurant.fromJson(json["collection"]),
      );
}

class Restaurant {
  final int collectionId;
  final String imageUrl;
  final String title;
  final String description;

  Restaurant({
    @required this.collectionId,
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        collectionId: json["collection_id"],
        imageUrl: json["image_url"],
        title: json["title"],
        description: json["description"],
      );
}
