import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_env.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapPlacePicker extends StatefulWidget {
  const MapPlacePicker({super.key});

  @override
  State<MapPlacePicker> createState() => _MapPlacePickerState();
}

class _MapPlacePickerState extends State<MapPlacePicker> {
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
                      print("on place ascoamweawefcse------");
                      print(result.adrAddress);
                      // Navigator.of(context).pop();
                    },
                    initialPosition: LatLng(AppEnv.default_latitude,AppEnv.default_longitude),
                    useCurrentLocation: true,
                    resizeToAvoidBottomInset: false,
                    selectedPlaceWidgetBuilder:
                        (context, selectedPlace, state, isSearchBarFocused) {
                      print("dafaosdnvkasncowaejfn_____________");
                      print(state.name);
                      print(selectedPlace);
                      if (selectedPlace != null) {
                        print(selectedPlace.adrAddress);
                      }
                      return SizedBox();
                    },
                    onCameraMove: (position) {
                      print(position.toMap());
                      print("dfawefac------");
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
                      onPressed: () async {},
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
                TextField(
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
                TextField(
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
                // FormField<String>(
                //   validator: (value) {
                //     if (value == null) {
                //       return "Select Your Township";
                //     }
                //   },
                //   onSaved: (value) {
                //     //formData['town'] = value;
                //   },
                //   builder: (
                //     FormFieldState<String> state,
                //   ) {
                //     return Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         InputDecorator(
                //           decoration: const InputDecoration(
                //             contentPadding: EdgeInsets.all(0.0),
                //             labelText: '',
                //           ),
                //           child: Container(
                //             padding:
                //                 EdgeInsets.symmetric(horizontal: 4.0),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(3.0),
                //               border: Border.all(
                //                   color: Colors.black45,
                //                   style: BorderStyle.solid,
                //                   width: 0.80),
                //             ),
                //             child: DropdownButtonHideUnderline(
                //               child: Listener(
                //                 // onPointerDown: (_) =>
                //                 //     fToast.removeCustomToast(),
                //                 child: DropdownButton<String>(
                //                   hint:
                //                        Text("Select Your Township"),
                //                   // value: (_township == "" ||
                //                   //         _township == null)
                //                   //     ? "Ahlon"
                //                   //     : _township,
                //                   value: _township ?? null,
                //                   onChanged: (String Value) {
                //                     state.didChange(Value);
                //                     setState(() {
                //                       _township = Value;
                //                     });
                //                   },
                //                   items: widget.townships.map((value) {
                //                     return  DropdownMenuItem<String>(
                //                       value: value,
                //                       child:  Text(
                //                         value,
                //                         style:
                //                             TextStyle(fontSize: 14.0),
                //                       ),
                //                     );
                //                   }).toList(),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(height: 5.0),
                //         Text(
                //           state.hasError ? state.errorText : '',
                //           style: TextStyle(
                //               color: Colors.redAccent.shade700,
                //               fontSize: 12.0),
                //         ),
                //       ],
                //     );
                //   },
                // ),
                TextField(
                    // controller: noteController,
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
            )),
      ),
    );
  }
}
