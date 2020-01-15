import 'package:meta/meta.dart';

class RestaurantItem {
  final List<RestaurantElement> restaurants;

  RestaurantItem({
    @required this.restaurants,
  });

  factory RestaurantItem.fromJson(Map<String, dynamic> json) => RestaurantItem(
        restaurants: List<RestaurantElement>.from(
            json["restaurants"].map((x) => RestaurantElement.fromJson(x))),
      );
}

class RestaurantElement {
  final RestaurantRestaurant restaurant;

  RestaurantElement({
    @required this.restaurant,
  });

  factory RestaurantElement.fromJson(Map<String, dynamic> json) =>
      RestaurantElement(
        restaurant: RestaurantRestaurant.fromJson(json["restaurant"]),
      );
}

class RestaurantRestaurant {
  final R r;
  final String id;
  final String name;
  final Location location;
  final String cuisines;
  final String timings;
  final int averageCostForTwo;
  final int priceRange;
  final List<String> highlights;
  final List<dynamic> offers;
  final UserRating userRating;
  final int allReviewsCount;
  final String photosUrl;
  final int photoCount;
  final List<PhotoElement> photos;
  final String menuUrl;
  final String featuredImage;
  final int hasOnlineDelivery;
  final int isDeliveringNow;
  final bool includeBogoOffers;
  final String deeplink;
  final int isTableReservationSupported;
  final int hasTableBooking;
  final String eventsUrl;
  final String phoneNumbers;
  final AllReviews allReviews;
  final List<String> establishment;
  final List<dynamic> establishmentTypes;

  RestaurantRestaurant({
    @required this.r,
    @required this.id,
    @required this.name,
    @required this.location,
    @required this.cuisines,
    @required this.timings,
    @required this.averageCostForTwo,
    @required this.priceRange,
    @required this.highlights,
    @required this.offers,
    @required this.userRating,
    @required this.allReviewsCount,
    @required this.photosUrl,
    @required this.photoCount,
    @required this.photos,
    @required this.menuUrl,
    @required this.featuredImage,
    @required this.hasOnlineDelivery,
    @required this.isDeliveringNow,
    @required this.includeBogoOffers,
    @required this.deeplink,
    @required this.isTableReservationSupported,
    @required this.hasTableBooking,
    @required this.eventsUrl,
    @required this.phoneNumbers,
    @required this.allReviews,
    @required this.establishment,
    @required this.establishmentTypes,
  });

  factory RestaurantRestaurant.fromJson(Map<String, dynamic> json) =>
      RestaurantRestaurant(
        r: R.fromJson(json["R"]),
        id: json["id"],
        name: json["name"],
        location: Location.fromJson(json["location"]),
        cuisines: json["cuisines"],
        timings: json["timings"],
        averageCostForTwo: json["average_cost_for_two"],
        priceRange: json["price_range"],
        highlights: List<String>.from(json["highlights"].map((x) => x)),
        offers: List<dynamic>.from(json["offers"].map((x) => x)),
        userRating: UserRating.fromJson(json["user_rating"]),
        allReviewsCount: json["all_reviews_count"],
        photosUrl: json["photos_url"],
        photoCount: json["photo_count"],
        photos: List<PhotoElement>.from(
            json["photos"].map((x) => PhotoElement.fromJson(x))),
        menuUrl: json["menu_url"],
        featuredImage: json["featured_image"],
        hasOnlineDelivery: json["has_online_delivery"],
        isDeliveringNow: json["is_delivering_now"],
        includeBogoOffers: json["include_bogo_offers"],
        deeplink: json["deeplink"],
        isTableReservationSupported: json["is_table_reservation_supported"],
        hasTableBooking: json["has_table_booking"],
        eventsUrl: json["events_url"],
        phoneNumbers: json["phone_numbers"],
        allReviews: AllReviews.fromJson(json["all_reviews"]),
        establishment: List<String>.from(json["establishment"].map((x) => x)),
        establishmentTypes:
            List<dynamic>.from(json["establishment_types"].map((x) => x)),
      );
}

class AllReviews {
  final List<Review> reviews;

  AllReviews({
    @required this.reviews,
  });

  factory AllReviews.fromJson(Map<String, dynamic> json) => AllReviews(
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );
}

class Review {
  final List<dynamic> review;

  Review({
    @required this.review,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        review: List<dynamic>.from(json["review"].map((x) => x)),
      );
}

class Location {
  final String address;
  final String locality;
  final String city;
  final int cityId;
  final String latitude;
  final String longitude;
  final String zipcode;
  final int countryId;
  final String localityVerbose;

  Location({
    @required this.address,
    @required this.locality,
    @required this.city,
    @required this.cityId,
    @required this.latitude,
    @required this.longitude,
    @required this.zipcode,
    @required this.countryId,
    @required this.localityVerbose,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"],
        locality: json["locality"],
        city: json["city"],
        cityId: json["city_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        zipcode: json["zipcode"],
        countryId: json["country_id"],
        localityVerbose: json["locality_verbose"],
      );
}

class PhotoElement {
  final PhotoPhoto photo;

  PhotoElement({
    @required this.photo,
  });

  factory PhotoElement.fromJson(Map<String, dynamic> json) => PhotoElement(
        photo: PhotoPhoto.fromJson(json["photo"]),
      );
}

class PhotoPhoto {
  final String id;
  final String url;
  final String thumbUrl;
  final User user;
  final int resId;
  final String caption;
  final int timestamp;
  final String friendlyTime;
  final int width;
  final int height;

  PhotoPhoto({
    @required this.id,
    @required this.url,
    @required this.thumbUrl,
    @required this.user,
    @required this.resId,
    @required this.caption,
    @required this.timestamp,
    @required this.friendlyTime,
    @required this.width,
    @required this.height,
  });

  factory PhotoPhoto.fromJson(Map<String, dynamic> json) => PhotoPhoto(
        id: json["id"],
        url: json["url"],
        thumbUrl: json["thumb_url"],
        user: User.fromJson(json["user"]),
        resId: json["res_id"],
        caption: json["caption"],
        timestamp: json["timestamp"],
        friendlyTime: json["friendly_time"],
        width: json["width"],
        height: json["height"],
      );
}

class User {
  final String name;
  final String foodieLevel;
  final int foodieLevelNum;
  final String foodieColor;
  final String profileUrl;
  final String profileImage;
  final String profileDeeplink;

  User({
    @required this.name,
    @required this.foodieLevel,
    @required this.foodieLevelNum,
    @required this.foodieColor,
    @required this.profileUrl,
    @required this.profileImage,
    @required this.profileDeeplink,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        foodieLevel: json["foodie_level"],
        foodieLevelNum: json["foodie_level_num"],
        foodieColor: json["foodie_color"],
        profileUrl: json["profile_url"],
        profileImage: json["profile_image"],
        profileDeeplink: json["profile_deeplink"],
      );
}

class R {
  final HasMenuStatus hasMenuStatus;
  final int resId;

  R({
    @required this.hasMenuStatus,
    @required this.resId,
  });

  factory R.fromJson(Map<String, dynamic> json) => R(
        hasMenuStatus: HasMenuStatus.fromJson(json["has_menu_status"]),
        resId: json["res_id"],
      );
}

class HasMenuStatus {
  final int delivery;
  final int takeaway;

  HasMenuStatus({
    @required this.delivery,
    @required this.takeaway,
  });

  factory HasMenuStatus.fromJson(Map<String, dynamic> json) => HasMenuStatus(
        delivery: json["delivery"],
        takeaway: json["takeaway"],
      );
}

class UserRating {
  final String aggregateRating;
  final String ratingText;
  final String ratingColor;
  final RatingObj ratingObj;
  final String votes;

  UserRating({
    @required this.aggregateRating,
    @required this.ratingText,
    @required this.ratingColor,
    @required this.ratingObj,
    @required this.votes,
  });

  factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
        aggregateRating: json["aggregate_rating"],
        ratingText: json["rating_text"],
        ratingColor: json["rating_color"],
        ratingObj: RatingObj.fromJson(json["rating_obj"]),
        votes: json["votes"],
      );
}

class RatingObj {
  final Title title;
  final BgColor bgColor;

  RatingObj({
    @required this.title,
    @required this.bgColor,
  });

  factory RatingObj.fromJson(Map<String, dynamic> json) => RatingObj(
        title: Title.fromJson(json["title"]),
        bgColor: BgColor.fromJson(json["bg_color"]),
      );
}

class BgColor {
  final String type;
  final String tint;

  BgColor({
    @required this.type,
    @required this.tint,
  });

  factory BgColor.fromJson(Map<String, dynamic> json) => BgColor(
        type: json["type"],
        tint: json["tint"],
      );
}

class Title {
  final String text;

  Title({
    @required this.text,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        text: json["text"],
      );
}
