import 'package:flutter/material.dart';

class PickupDocket extends StatefulWidget {
  static const routeName = "PickupDocket";
  const PickupDocket({super.key});

  @override
  State<PickupDocket> createState() => _PickupDocketState();
}

class _PickupDocketState extends State<PickupDocket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
                      "Pickup Details",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
      ),
    );
  }
}



// import 'dart:async';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:la_logistics/screens/update_docket.dart';
// import 'package:la_logistics/screens/update_pickup.dart';
// import 'package:provider/provider.dart';
//
// import '../backend_files/get_docket_by_id.dart';
// import '../backend_files/provider_state.dart';
//
// class PickupDocket extends StatefulWidget {
//   static const routeName = "PickupDocket";
//   const PickupDocket({super.key});
//
//   @override
//   State<PickupDocket> createState() => _PickupDocketState();
// }
//
// class _PickupDocketState extends State<PickupDocket> {
//   FutureOr callSetState(dynamic value) {
//     print("calling ittt");
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var queryData = MediaQuery.of(context);
//     GetDocketById getDocket = Provider.of<GetDocketById>(context);
//     ProviderState providerState = Provider.of<ProviderState>(context);
//     print(providerState.deliveryBoyId);
//     return Scaffold(
//       backgroundColor: const Color(0xFF3F3351),
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: queryData.size.height,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25)),
//               color: Colors.white),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   const Text(
//                     "Pickup Details",
//                     style: TextStyle(
//                         fontSize: 22,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: queryData.size.height * 0.03,
//                   ),
//                   FutureBuilder(
//                     future: getDocket.getpickupById(providerState.deliveryBoyId),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         //log('data isssss ${(snapshot.data as Map)["data"][0]["PickupDetails"]["Docket"][0]["DocketId"]}');
//                       }
//                       return snapshot.hasData
//                           ? ListView.builder(
//                               itemCount: (snapshot.data as Map)["data"].length,
//                               scrollDirection: Axis.vertical,
//                               physics: BouncingScrollPhysics(),
//                               shrinkWrap: true,
//                               itemBuilder: (context, index) {
//                                 return Column(
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color:
//                                                   Colors.grey.withOpacity(0.3),
//                                               blurRadius: 10.0,
//                                               offset: const Offset(0, 10),
//                                               spreadRadius: 1,
//                                             ),
//                                           ],
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                           border: Border.all(
//                                               width: 1, color: Colors.black)),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(20.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Refrence No: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["Reference"]}",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     "No. of Samples: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["NoOfPcs"]}",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height:
//                                                   queryData.size.height * 0.02,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Pickup Date: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["Date"]}",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Pickup Time: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["PickupTime"]}",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height:
//                                                   queryData.size.height * 0.02,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Packaging Required: Required",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     (snapshot.data as Map)[
//                                                                         "data"]
//                                                                     [index][
//                                                                 "PackageDetails"]
//                                                             .isNotEmpty
//                                                         ? "Shipment Temprature: ${(snapshot.data as Map)["data"][index]['PackageDetails'][0]['Temperature']}"
//                                                         : "Shipment Temprature:",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height:
//                                                   queryData.size.height * 0.02,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Contact Person Name: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["PickupRegistered"]}",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Contact Person Number: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["PickupRegisteredNumber"]}",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height:
//                                                   queryData.size.height * 0.02,
//                                             ),
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     "Pickup received: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["IsPickupRecived"]}",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     (snapshot.data as Map)["data"][index]["PickupDetails"]["Docket"].isNotEmpty
//                                                     ? "Docket Id: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["Docket"][0]["DocketId"]} "
//                                                     : "Docket Id: ",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height:
//                                                   queryData.size.height * 0.02,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     (snapshot.data as Map)[
//                                                                         "data"]
//                                                                     [index]["PickupDetails"]
//                                                                 ["ConsigneeDetails"]
//                                                             .isNotEmpty
//                                                         ? "Pickup Address: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["ConsigneeDetails"][0]["BillingAddress"]}"
//                                                         : "Pickup Address: ",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     (snapshot.data as Map)[
//                                                                         "data"]
//                                                                     [index]["PickupDetails"]
//                                                                 ["ConsignerDetails"]
//                                                             .isNotEmpty
//                                                         ? "Delivery Location: ${(snapshot.data as Map)["data"][index]["PickupDetails"]["ConsignerDetails"][0]["BillingAddress"]}"
//                                                         : "Delivery Location: ",
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height:
//                                                   queryData.size.height * 0.03,
//                                             ),
//                                             Center(
//                                               child: SizedBox(
//                                                 width:
//                                                     queryData.size.width * 0.3,
//                                                 height: queryData.size.height *
//                                                     0.06,
//                                                 child: ElevatedButton(
//                                                   onPressed: () => Navigator.of(
//                                                           context)
//                                                       .pushNamed(
//                                                           UpdatePickup
//                                                               .routeName,
//                                                           arguments: (snapshot
//                                                                   .data as Map)[
//                                                               "data"][index])
//                                                       .then(callSetState),
//                                                   style: ElevatedButton.styleFrom(
//                                                       backgroundColor: const Color(
//                                                           0xFF864879),
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           20.0))),
//                                                   child: const Text(
//                                                     "Update",
//                                                     style: TextStyle(
//                                                         fontSize: 18,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color: Colors.white),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: queryData.size.height * 0.03,
//                                     ),
//                                   ],
//                                 );
//                               },
//                             )
//                           : Center(child: CircularProgressIndicator());
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
