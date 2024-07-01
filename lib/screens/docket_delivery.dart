import 'package:flutter/material.dart';
import 'package:la_logistics/screens/updating_docket.dart';

class DocketDelivery extends StatefulWidget {
  static const routeName = "DocketDelivery";
  const DocketDelivery({Key? key}) : super(key: key);

  @override
  State<DocketDelivery> createState() => _DocketDeliveryState();
}

class _DocketDeliveryState extends State<DocketDelivery> {
  // TextEditingController _myController = TextEditingController();
  // final controller = Get.put(DocketDetailsController());
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    // GetDocketById getDocket = Provider.of<GetDocketById>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(UpdatingDocketScreen.routeName);
          },
          child: Container(
            height: 50,
            width: 370,
            decoration: BoxDecoration(
                color: Color(0xFF20147B),
                borderRadius: BorderRadius.circular(15)),
            child: const Center(
                child: Text(
              "CONTINUE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Container(
                        height: 140,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF20147B)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Text(
                                "Need Help ?",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "Raise   tickets   for  issues   on   your delivery.",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            'assets/jpg_img/TicketPurchase1.jpg',
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: queryData.size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Can’t find your Docket Delivery?",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.001,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "To track your docket using your Docket Number ",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.03,
                ),
                Form(

                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter your Docket Number",
                        filled: true,
                        fillColor: const Color(0xFFF0F0F0),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: ()  {
                            // Navigator.of(context).pushNamed(UpdatingDocketScreen.routeName);
                  
                            // var result = await getDocket.getDetails(int.parse(_myController.text));
                            // var cityMap = await getDocket.getCity();
                            // print(cityMap["data"][0]["Cityid"].runtimeType);
                            // String origin = "";
                            // String destination = "";
                            // //origin.compareTo();
                            // for (var element in cityMap["data"]) {
                            //   if(element["Cityid"] != null){
                            //     if(element["Cityid"].compareTo(result["data"][0]["PickupDetails"][0]["OriginId"]) == 0){
                            //     origin = element["City"];
                            //   }
                            //   if(element["Cityid"].compareTo(result["data"][0]["PickupDetails"][0]["DestinationId"]) == 0){
                            //     destination = element["City"];
                            //   }
                            //   }
                            // }
                            // Navigator.of(context).pushNamed(UpdatingDocketScreen.routeName, arguments: result);
                            // // ignore: use_build_context_synchronously
                            // pushNewScreenWithRouteSettings(
                            //   context,
                            //   screen: const UpdatingDocketScreen(),
                            //   settings: RouteSettings(
                            //       name: UpdatingDocketScreen.routeName,
                            //       arguments: {
                            //         "main": result,
                            //         "origin": origin,
                            //         "destination": destination
                            //       }),
                            // );
                          },
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.04,
                ),

                // SizedBox(
                //   width: double.infinity,
                //   height: queryData.size.height * 0.06,
                //   child: ElevatedButton(
                //     onPressed: ((){
                //       // pushNewScreenWithRouteSettings(
                //       //   context,
                //       //   screen: const QrScannerScreen(),
                //       //   settings: const RouteSettings(name: QrScannerScreen.routeName),
                //       //   withNavBar: false
                //       // );
                //     }),
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: const Color(0xFF864879),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20.0)
                //       )
                //     ),
                //     child: const Text(
                //       "Delivery Run Sheet",
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.white
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
