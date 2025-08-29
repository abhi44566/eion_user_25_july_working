import 'package:driver_suvidha_user/provider/data/response/api_params_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/home_page_view_model.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/map_view_model.dart';
import 'package:driver_suvidha_user/utils/progress_bar.dart';
import 'package:driver_suvidha_user/import.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class NavigateMapScreen extends StatefulWidget {
  final String? bookingId;
  final bool? isRide;
  NavigateMapScreen({super.key, this.bookingId, this.isRide});
  @override
  State<NavigateMapScreen> createState() => _NavigateMapScreenState();
}

class _NavigateMapScreenState extends State<NavigateMapScreen>
    with TickerProviderStateMixin {
  bool isConfirmLocation = false;
  String? selectedPickUpAddress;
  late Future<LatLng>? _initialPosition;
  Timer? searchDriverTimer;
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        final userID = await MySharedPreferences.getUserId();
        searchDriverTimer = Timer.periodic(Duration(seconds: 5), (timer) {
          Provider.of<HomePageViewModel>(context, listen: false)
              .getOrderDetailApi(
                  ApiParamsModels.getOrderParam(
                      userID.toString(), widget.bookingId.toString()),
                  context);
        });
      },
    );
    _initialPosition =
        Provider.of<MapViewModel>(context, listen: false).getCurrentLocation();
  }

  @override
  void dispose() {
    searchDriverTimer?.cancel();
    super.dispose();
  }

  DateTime? lastPressed;
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    final getHomePage = Provider.of<HomePageViewModel>(context, listen: false);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Consumer<HomePageViewModel>(
          builder: (context, value, child) {
            final getOrderDetailRes =
                value.getOrderDetailRes?.response?.historyList?.first;
            return value.isMapLoading
                ? const Center(child: CustomProgressBar())
                : Stack(
                    children: [
                      FutureBuilder<LatLng>(
                        future: _initialPosition,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text("Error: ${snapshot.error}"));
                          } else {
                            final currentPosition = snapshot.data!;
                            return Consumer<MapViewModel>(
                              builder: (context, mapViewModel, child) {
                                return GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: currentPosition,
                                    zoom: 15,
                                  ),
                                  onMapCreated: (controller)async {
                                    mapViewModel.mapController = controller;
                                    mapViewModel.isMapReady = true;
                                    mapViewModel.fitCameraToMarkers();
                                    final style = await rootBundle.loadString('assets/map_style.json');
                                    controller.setMapStyle(style);
                                  },
                                  markers: mapViewModel.markers,
                                  polylines: mapViewModel.polylines,
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                );
                              },
                            );
                          }
                        },
                      ),
                      // if (value.isHeader == true)
                      //   Header(
                      //     isFev: false,
                      //     onTap: () async {
                      //       String? refresh = await Navigator.push(
                      //           context,
                      //           MaterialPageRoute(builder: (context) =>const SettingScreen()));
                      //       if (refresh == "refresh") {
                      //         setState(() {});
                      //       }
                      //     },
                      //     title: value.address != null? value.address: "Fetching location...",),
                      // if (value.isPickUpLocation == true)
                      //   PickUpLocationHeader(title: value.address != null? value.address : "Fetching location..."),
                      if (value.getOrderDetailRes?.response != null)
                        Positioned(
                            bottom: 0,
                            child: trackStatus(
                              OTP: getOrderDetailRes?.startOtp??'',
                              tripTypeImage: getOrderDetailRes?.icon ?? '',
                              bookingLavel: getOrderDetailRes?.bookingLevel ?? '',
                              tripType: getOrderDetailRes?.tripType ?? '',
                              date: getOrderDetailRes?.timeDisplayLevel ?? '',
                              status: getOrderDetailRes?.bookingStatus ?? '',
                              time: '',
                              bookingId: getOrderDetailRes?.bookingId ?? '',
                              TrackBOnTap: () {
                                if (widget.isRide == true) {
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyRideScreen(),
                                      ));
                                }
                              },
                              tripHrs:
                                  getOrderDetailRes?.rideDurationDisplay ?? '',
                              tripKm: getOrderDetailRes?.distanceDisplay ?? '',
                            ))else
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: fontSize.h/5,
                                  decoration: BoxDecoration(
                                  color: Colors.white
                                ),
                                  child: Center(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.search),
                                          Text(
                                            "Searching Cab...",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset("assets/searching2.gif", height: 100),

                                    ],
                                  ),
                                )),
                              )
                    ],
                  );
          },
        ));
  }
}
