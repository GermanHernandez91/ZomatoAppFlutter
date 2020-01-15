import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

abstract class Networking {
  static Future<Map<String, String>> configureLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final queryParams = {
      "lat": prefs.getString("lat"),
      "lon": prefs.getString("lon"),
    };

    return queryParams;
  }

  static Map<String, String> configureHeaders() {
    return {"user-key": Constants.apiKey};
  }

  static Uri configureUri(String route, [Map<String, dynamic> parameters]) {
    return Uri.https(Constants.baseURL, route, parameters);
  }
}
