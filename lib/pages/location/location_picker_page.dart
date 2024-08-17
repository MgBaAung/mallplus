
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:mall_plus_new_customer_app/pages/location/controller/location_picker_controller.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_env.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LocationPickerPage extends GetView<LocationPickerController> {
  TextEditingController street_controller = TextEditingController(),floor_controller = TextEditingController(),biker_note_controller = TextEditingController();
  final GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();
  LocationPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Stack(
          children: [
            SlidingUpPanel(
              parallaxEnabled: true,
              defaultPanelState: PanelState.CLOSED,
              maxHeight: 445,
              minHeight: 120,
              parallaxOffset: 0.65,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              panel: locationCard(),
              body: Stack(
                children: [
                  PlacePicker(
                    apiKey: AppEnv.google_map_api_key,
                    onPlacePicked: (result) {
                      print("on place picked------");
                      print(result.adrAddress);
                      print(result.geometry!.location.lat);
                      // Navigator.of(context).pop();
                    },
                    onCameraIdle: (result){
                      if(result.cameraPosition!.target != null ){
                        controller.cameraidele(result);
                      }
                    },
                    desiredLocationAccuracy: LocationAccuracy.high,
                    initialPosition: LatLng(AppEnv.default_latitude,AppEnv.default_longitude),
                    useCurrentLocation: true,
                    resizeToAvoidBottomInset: false,
                    selectedPlaceWidgetBuilder:
                        (context, selectedPlace, state, isSearchBarFocused) {
                      // print("selected place widget builder_____________");
                      // print(state.name);
                      // print(selectedPlace);
                      // if (selectedPlace != null) {
                      //   print("selected place not null-----------------");
                      //   controller.placepicked(selectedPlace);
                      // }
                      return SizedBox();
                    },
                    onCameraMove: (position) {
                      print(position.toMap());
                      print("on camera move------");
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.red,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Apply And Save",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if(_addressFormKey.currentState!.validate()){
                          controller.saveAddress(
                              address_detail: street_controller.text,
                              floor: floor_controller.text,
                              note_to_biker: biker_note_controller.text
                          );
                        }

                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget locationCard() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Card(
            elevation: 0,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 5,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                    "အိမ်နံပါတ်၊ လမ်းအမည်နှင့် မြို့နယ်တို့ကို ပြည့်စုံမှန်ကန်စွာ ထည့်ပါ။",
                    style: TextStyle(fontSize: 12.0, color: Colors.black)),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: _addressFormKey,
                    child: Column(
                  children: [
                    TextFormField(
                        controller: street_controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(0),
                              ),
                              borderSide:
                              BorderSide(width: 0.2, color: Colors.black45),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                              borderSide: BorderSide(width: 1, color: Colors.red),
                            ),

                            labelText: 'အိမ်နံပါတ်နှင့် လမ်းအမည်',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Home no. and street name ",
                            // errorText: addressDetailController.text.isEmpty
                            //     ? 'Value Can\'t Be Empty'
                            //     : null,
                            fillColor: Colors.white70),
                        style: TextStyle(fontSize: 12.0, color: Colors.black)),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                        controller: floor_controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(0),
                              ),
                              borderSide:
                              BorderSide(width: 0.2, color: Colors.black45),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                              borderSide: BorderSide(width: 1, color: Colors.red),
                            ),
                            labelText: 'အလွှာနှင့် အခန်းအမှတ် ',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            filled: true,
                            hintText: "Floor and room no.",
                            hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.redAccent),
                            fillColor: Colors.white70),
                        style: TextStyle(fontSize: 13.0, color: Colors.black)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: biker_note_controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(0),
                              ),
                              borderSide:
                              BorderSide(width: 0.2, color: Colors.black45),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                              borderSide: BorderSide(width: 1, color: Colors.red),
                            ),
                            labelText: 'Note to biker ',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            filled: true,
                            hintText: "Note to biker",
                            hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.redAccent),
                            fillColor: Colors.white70),
                        minLines: 2,
                        maxLines: 3,
                        style: TextStyle(fontSize: 13.0, color: Colors.black)),
                  ],
                ))
              ],
            )),
      ),
    );
  }
  }



