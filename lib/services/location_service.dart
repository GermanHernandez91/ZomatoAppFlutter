import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationService {
  static requestPermissions() async {
    await PermissionHandler().requestPermissions([PermissionGroup.location]);
  }

  static storeUserCurrentLocation(String postCode) async {
    ServiceStatus serviceStatus =
        await PermissionHandler().checkServiceStatus(PermissionGroup.location);

    if (serviceStatus == ServiceStatus.enabled) {
      List<Placemark> placemark =
          await Geolocator().placemarkFromAddress(postCode);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString("lat", placemark[0].position.latitude.toString());
      prefs.setString("lon", placemark[0].position.longitude.toString());
    }
  }

  static Future<bool> userLocationIsStored() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String latitude = prefs.getString("lat");
    String longitude = prefs.getString("lon");

    if (latitude != null && longitude != null) {
      return true;
    }

    return false;
  }
}
