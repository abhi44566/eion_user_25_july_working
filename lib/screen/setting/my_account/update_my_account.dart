import 'dart:io';

import 'package:driver_suvidha_user/import.dart';
import 'package:driver_suvidha_user/screen/setting/provider/model/get_city_state_model.dart';
import 'package:driver_suvidha_user/utils/network_image.dart';
import 'package:driver_suvidha_user/utils/progress_bar.dart';
import 'package:image_picker/image_picker.dart';
class UpdateMyAccount extends StatefulWidget {
  const UpdateMyAccount({super.key});

  @override
  State<UpdateMyAccount> createState() => _UpdateMyAccountState();
}

class _UpdateMyAccountState extends State<UpdateMyAccount> {
  void initState() {
    super.initState();
    Future.microtask( () {
      fetchData();
    },);

  }
  void fetchData(){
    Provider.of<ProfileViewModel>(context,listen: false).getProfileApi(context).then((value) {
      Provider.of<ProfileViewModel>(context,listen: false).setProfileValue();
      Provider.of<ProfileViewModel>(context,listen: false).fetchCityStateList(context);
    },);
  }
  int? updateCityList;
  @override
  Widget build(BuildContext context) {
    MyFontSize fontSize = MyFontSize(context);
    return Scaffold(
        body: Consumer<ProfileViewModel>(builder: (context, value, child) {
          final stateList = value.getCityStateRes?.response?.stateList;
          final cityList = value.getCityStateRes?.response?.stateList;
          // Remove duplicates from state list
          final uniqueStates = (stateList ?? []).toSet().toList();

// Remove duplicates from current city list
          final selectedCityGroup = cityList?[updateCityList ?? 0].cityList ?? [];
          final uniqueCities = selectedCityGroup.toSet().toList();

          return Stack(
            children: [
              Column(children: [
                Container(
                  color: AppColor.appColor,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: fontSize.h*0.04),
                      BackButton(color: AppColor.whiteColor),
                      SizedBox(height: fontSize.h*0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Headings.txt34WhiteBold("My account", context),
                            Stack(
                              children: [
                                InkWell(
                                  onTap:(){
                                    value.pickImage(ImageSource.gallery, context);
                                  },
                                  child: value.selectedImage?.path==null?
                                  CustomNetworkProfileImage(
                                    height: 80,
                                      width: 80,
                                      image: value.getProfileRes?.response?.profilePhoto??''):
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: FileImage(File(value.selectedImage!.path)),),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: Container(
                                      decoration: BoxDecoration(shape: BoxShape.circle,  color: Colors.grey,),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Icon(Icons.add, color: AppColor.whiteColor,size: 20,),
                                      )),
                                ),
                              ],
                            ),
                          ],),

                      ),
                      SizedBox(height: fontSize.h*0.02),
                    ],),
                ),
                SizedBox(height: fontSize.h*0.02),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                       // height: MediaQuery.of(context).size.height * 0.4,,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Headings.txt13black("Name", context),
                          CustomTextForm(
                            controller: value.nameController,
                            hintText: 'Name',
                          ),
                            Headings.txt13black("Email", context),
                          CustomTextForm(
                            controller: value.emailController,
                            hintText: 'Email',
                          ),
                            Headings.txt13black("phone", context),
                          CustomTextForm(
                            controller: value.phoneController,
                            hintText: 'Phone',
                          ),
                            Headings.txt13black("Address", context),
                          CustomTextForm(
                            controller: value.addressController,
                            hintText: 'Address',
                          ),
                            SizedBox(height: fontSize.h*0.02),


                            DropdownButtonFormField<StateList>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              ),
                              value: uniqueStates.contains(value.selectedState) ? value.selectedState : null,
                              hint: Text('${value.getProfileRes?.response?.state ?? "Select a state"}'),
                              items: uniqueStates.map((state) {
                                return DropdownMenuItem<StateList>(
                                  value: state,
                                  onTap: () {
                                    setState(() {
                                      updateCityList = stateList?.indexOf(state) ?? 0;
                                    });
                                  },
                                  child: Text(state.name ?? ''),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  value.selectedState = newValue;
                                });
                              },
                            ),
                            SizedBox(height: fontSize.h * 0.02),
                            DropdownButtonFormField<CityList>(
                              value: uniqueCities.contains(value.selectedCity) ? value.selectedCity : null,
                              isExpanded: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              ),
                              hint: Text("${value.getProfileRes?.response?.city ?? "Select a City"}"),
                              items: uniqueCities.map((city) {
                                return DropdownMenuItem<CityList>(
                                  value: city,
                                  child: Text(city.name ?? ''),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  value.selectedCity = newValue;
                                });
                                print("Selected City: $newValue");
                              },
                            ),

                            SizedBox(height: fontSize.h*0.02),
                            Headings.txt13black("Pin", context),
                          CustomTextForm(
                            controller: value.zipController,
                            hintText: 'Pin',
                          ),
                            Headings.txt13black("Country", context),
                          CustomTextForm(
                            enabled: false,
                            controller: value.countryController,
                            hintText: 'India',
                          ),
                          // detailWidget("Password", "********", context),
                        ],),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: CustomButton(onTap: (){
                      value.updateProfileApi(context);
                    }, child: Headings.txt17BlackBold("Save", context)),
                  ),
                )
              ],),
              value.isLoading?Center(child: CustomProgressBar()):SizedBox()
            ],
          );
        },)
    );
  }

  Widget detailWidget(String title, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Headings.txt17BlackBold(title, context),
          Row(children: [
            Headings.txt17greyBold(value, context),
            // SizedBox(width: fontSize.w*0.02),
            // Icon(Icons.arrow_forward_ios, size: fontSize.w*0.05,)
          ],)
        ],),
    );
  }
}
