import 'package:meta/meta.dart';

class Cuisines {
  final List<CuisineElement> cuisines;

  Cuisines({
    @required this.cuisines,
  });

  factory Cuisines.fromJson(Map<String, dynamic> json) => Cuisines(
        cuisines: List<CuisineElement>.from(
            json["cuisines"].map((x) => CuisineElement.fromJson(x))),
      );
}

class CuisineElement {
  final Cuisine cuisine;

  CuisineElement({
    @required this.cuisine,
  });

  factory CuisineElement.fromJson(Map<String, dynamic> json) => CuisineElement(
        cuisine: Cuisine.fromJson(json["cuisine"]),
      );
}

class Cuisine {
  final int cuisineId;
  final String cuisineName;

  Cuisine({
    @required this.cuisineId,
    @required this.cuisineName,
  });

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        cuisineId: json["cuisine_id"],
        cuisineName: json["cuisine_name"],
      );
}
