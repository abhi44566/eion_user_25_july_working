import 'package:driver_suvidha_user/import.dart';
class LocationService {
  Future<LatLng?> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      print('Error fetching current location: $e');
      return null;
    }
  }

  Future<List<Placemark>> getPlacemarks(LatLng location) async {
    return await placemarkFromCoordinates(location.latitude, location.longitude);
  }

  Future<LocationPermission> checkLocationPermission() async {
    return await Geolocator.checkPermission();
  }

  Future<LocationPermission> requestLocationPermission() async {
    return await Geolocator.requestPermission();
  }




}
