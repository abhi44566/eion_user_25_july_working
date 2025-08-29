import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/home_page_view_model.dart';

class MapViewModel extends ChangeNotifier {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  LatLng? origin;
  LatLng? destination;
  bool isMapReady = false;
  BuildContext? appContext;
  BitmapDescriptor? customIcon;

  void fetchLocation(BuildContext context, {String? bookingId}) {
    appContext = context;
    final getBooking = Provider.of<HomePageViewModel>(context, listen: false)
        .getOrderDetailRes?.response?.historyList?.first;

    double fromLat = double.tryParse(getBooking?.fromGpsLat ?? '') ?? 0.0;
    double fromLng = double.tryParse(getBooking?.fromGpsLong ?? '') ?? 0.0;
    double toLat = double.tryParse(getBooking?.toGpsLat ?? '') ?? 0.0;
    double toLng = double.tryParse(getBooking?.toGpsLong ?? '') ?? 0.0;

    origin = LatLng(fromLat, fromLng);
    destination = LatLng(toLat, toLng);

    if ((fromLat != 0.0 && fromLng != 0.0) && (toLat != 0.0 && toLng != 0.0)) {
      _getRoutePolyline();
      _loadCustomMarker();
      fitCameraToMarkers();
    } else {
      print("🛑 Invalid location data. Not showing route or markers.");
    }
  }

  void fitCameraToMarkers() {
    if (!isMapReady || origin == null || destination == null) return;
    LatLngBounds bounds;
    if (origin!.latitude > destination!.latitude &&
        origin!.longitude > destination!.longitude) {
      bounds = LatLngBounds(southwest: destination!, northeast: origin!);
    } else if (origin!.longitude > destination!.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(origin!.latitude, destination!.longitude),
          northeast: LatLng(destination!.latitude, origin!.longitude));
    } else if (origin!.latitude > destination!.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destination!.latitude, origin!.longitude),
          northeast: LatLng(origin!.latitude, destination!.longitude));
    } else {
      bounds = LatLngBounds(southwest: origin!, northeast: destination!);
    }
    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 80));
  }

  void _loadCustomMarker() async {
    customIcon ??= await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(20, 30)),
      'assets/car_android.png',
    );
    // Driver Current Location Marker
    final getOrderBooking = Provider.of<HomePageViewModel>(appContext!, listen: false);
    final getBooking = getOrderBooking.getOrderDetailRes?.response?.historyList?.first;
    markers.clear();

    // Origin Marker
    markers.add(Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      markerId: const MarkerId("origin"),
      position: origin ?? const LatLng(0.0, 0.0),
      infoWindow:  InfoWindow(title: "Pickup",snippet:  getOrderBooking.getOrderDetailRes?.response?.historyList?.first.orgFromGpsLocation.toString()),
    ));

    // Destination Marker
    markers.add(Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      markerId: const MarkerId("destination"),
      position: destination ?? const LatLng(0.0, 0.0),
      infoWindow:  InfoWindow(title: "Drop-off",snippet:getOrderBooking.getOrderDetailRes?.response?.historyList?.first.toGpsLocation.toString()),
    ));



   print("bookingStatus::${getBooking?.bookingStatus}");
    double driverLat = double.tryParse(getBooking?.driverLat ?? '') ?? 0.0;
    double driverLng = double.tryParse(getBooking?.driverLong ?? '') ?? 0.0;

    if (driverLat != 0.0 && driverLng != 0.0) {
      markers.add(Marker(
        icon: customIcon!,
        markerId: const MarkerId("driver"),
        position: LatLng(driverLat, driverLng),
        infoWindow:  InfoWindow(
            title: "Driver",
            snippet: getOrderBooking.getOrderDetailRes?.response?.historyList?.first.driverGpsLocation.toString()),
      ));
    }

    notifyListeners();
  }

  void _getRoutePolyline() async {
    final getBooking = Provider.of<HomePageViewModel>(appContext!, listen: false)
        .getOrderDetailRes?.response?.historyList?.first;

    double driverLat = double.tryParse(getBooking?.driverLat ?? '') ?? 0.0;
    double driverLng = double.tryParse(getBooking?.driverLong ?? '') ?? 0.0;
    LatLng driverLocation = LatLng(driverLat, driverLng);

    if (origin == null || destination == null) {
      print("📍 Skipping polyline - origin/destination missing");
      return;
    }

    LatLng start;
    LatLng end;

    if (getBooking?.bookingStatus == '2') {
      if (origin!.latitude == 0.0 || origin!.longitude == 0.0 ||
          driverLat == 0.0 || driverLng == 0.0) {
        print("📍 Skipping polyline - invalid pickup or driver location");
        return;
      }
      start = origin!;
      end = driverLocation;
    } else if (getBooking?.bookingStatus == '3' || getBooking?.bookingStatus == '4') {
      if (destination!.latitude == 0.0 || destination!.longitude == 0.0 ||
          driverLat == 0.0 || driverLng == 0.0) {
        print("📍 Skipping polyline - invalid drop-off or driver location");
        return;
      }
      start = driverLocation;
      end = destination!;
    } else {
      print("ℹ️ No polyline to draw for booking status ${getBooking?.bookingStatus}");
      polylines.clear();
      return;
    }

    // Proceed with polyline generation
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyDLCESWG3BinAKTPr4ZqFMbWGULb-9Oe70',
      request: PolylineRequest(
        origin: PointLatLng(start.latitude, start.longitude),
        destination: PointLatLng(end.latitude, end.longitude),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isNotEmpty) {
      polylineCoordinates.clear();
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      polylines.clear();
      polylines.add(
        Polyline(polylineId: const PolylineId("route"), points: polylineCoordinates, color: Colors.blue, width: 5,),
      );
      notifyListeners();
    } else {
      print("❌ No polyline drawn. Error: ${result.errorMessage}");
    }
  }


  Future<LatLng> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions are permanently denied.");

    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return LatLng(position.latitude, position.longitude);
  }

  Future<String> getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        return "${p.name}, ${p.locality}, ${p.administrativeArea}, ${p.country}";
      }
    } catch (e) {
      print("🛑 Failed to reverse geocode: $e");
    }
    return "Unknown Location";
  }
}
