import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/map_screen/provider/home_page_view_model.dart';
import 'package:driver_suvidha_user/utils/progress_bar.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';

const String googleApiKey = "AIzaSyDLCESWG3BinAKTPr4ZqFMbWGULb-9Oe70";

class GoogleSearchScreen extends StatefulWidget {
  final String? title;
  final String? type;
  GoogleSearchScreen({super.key, this.title, this.type});
  @override
  State<GoogleSearchScreen> createState() => _GoogleSearchScreenState();
}

class _GoogleSearchScreenState extends State<GoogleSearchScreen> {
  final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: googleApiKey);
  final TextEditingController _searchController = TextEditingController();
  List<Prediction> _predictions = [];
  bool _isLoading = false;
  void _searchPlaces(String query) async {
    if (query.isEmpty) return;
    setState(() {
      _isLoading = true;
    });

    final response = await _places.autocomplete(
      query,
      components: [const Component(Component.country, "in")],
      language: "en",
    );

    setState(() {
      _isLoading = false;
      _predictions = response.predictions;
    });
  }

  @override
  void initState() {
    super.initState();
    onRefresh();
  }

  void onRefresh(){
    Future.microtask(
          () {
        Provider.of<HomePageViewModel>(context, listen: false).getFevAddressList(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.appColor,
          leading: BackButton(
            color: AppColor.whiteColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Headings.txt17WhiteBold(widget.title.toString(), context)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextForm(
              controller: _searchController,
              hintText: "Search for an address...",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: AppColor.blackColor,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _predictions = [];
                        });
                      },
                    )
                  : Icon(Icons.location_searching, color: AppColor.appColor),
              onChanged: (value) {
                _searchPlaces(value);
              },
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            // Display Predictions
            if (!_isLoading &&
                _predictions.isEmpty &&
                _searchController.text.isNotEmpty)
              const Text("No results found."),
            if (_predictions.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _predictions.length,
                  itemBuilder: (context, index) {
                    final prediction = _predictions[index];
                    return ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(prediction.description ?? ""),
                      onTap: () async {
                        final details = await _places
                            .getDetailsByPlaceId(prediction.placeId!);
                        final selectedAddress = details.result.formattedAddress;
                        if (widget.type == "pick") {
                          final fromLat = details.result.geometry?.location.lat;
                          final fromlong =
                              details.result.geometry?.location.lng;
                          if (selectedAddress != null &&
                              fromLat != null &&
                              fromlong != null) {
                            Navigator.pop(context, {
                              "address": selectedAddress,
                              "fromLatitude": fromLat,
                              "fromLongitude": fromlong,
                            });
                            // Returning data to previous screen
                          }
                        } else {
                          final lat = details.result.geometry?.location.lat;
                          final lng = details.result.geometry?.location.lng;
                          if (selectedAddress != null &&
                              lat != null &&
                              lng != null) {
                            Navigator.pop(context, {
                              "address": selectedAddress,
                              "latitude": lat,
                              "longitude": lng,
                            });
                          }
                        }
                      },
                    );
                  },
                ),
              )
            else
              Consumer<HomePageViewModel>(
                builder: (context, value, child) {
                  final getFevList =
                      value.getFevAddressRes.response?.favouriteLocationList;
                  return value.isLoading
                      ? CustomProgressBar()
                      : Expanded(
                          child: ListView.builder(
                            itemCount: getFevList?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const Icon(Icons.location_on),
                                title: Text(getFevList![index].gpsAddress ?? ''),

                                trailing: IconButton(onPressed: () async{
                                await  Provider.of<HomePageViewModel>(context, listen: false)
                                      .favAddressRemove(context,fav_address_id:getFevList[index].id ?? '' ).then((value) {
                                  onRefresh();
                                      },);
                                }, 
                                    icon: Icon(Icons.clear,color: AppColor.appColor,size: 30,)),

                                onTap: () async {
                                  if (widget.type == "pick") {
                                    Navigator.pop(context, {
                                      "address":
                                          getFevList[index].gpsAddress ?? '',
                                      "fromLatitude":
                                          getFevList[index].gpsLat ?? '',
                                      "fromLongitude":
                                          getFevList[index].gpsLong ?? '',
                                    });
                                  } else {
                                    print(widget.type);
                                    Navigator.pop(context, {
                                      "address":
                                          getFevList[index].gpsAddress ?? '',
                                      "latitude":
                                          getFevList[index].gpsLat ?? '',
                                      "longitude":
                                          getFevList[index].gpsLong ?? '',
                                    });
                                  }
                                },

                              );
                            },
                          ),
                        );
                },
              )
          ],
        ),
      ),
    );
  }
}
