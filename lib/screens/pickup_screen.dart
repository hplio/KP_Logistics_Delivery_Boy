import 'package:flutter/material.dart';
import 'package:la_logistics/custom/choose_profile_container.dart';
import 'package:la_logistics/screens/DrawerScreen.dart';
import 'package:la_logistics/screens/notification_screen.dart';
import 'package:la_logistics/screens/pickup_docket.dart';
import 'package:la_logistics/screens/track_docket.dart';
import 'package:la_logistics/screens/update_docket.dart';

class PickupScreen extends StatefulWidget {
  static const routeName = "PickupScreen";
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  bool isSelected = false;

  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    // var queryData = MediaQuery.of(context);
    return Scaffold(
      drawer: const DrawerScreen(),
      bottomNavigationBar: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: GestureDetector(
          onTap: (){
            if(_selectedValue==1){
              Navigator.of(context).pushNamed(TrackDocket.routeName);

            }else if(_selectedValue==2){
              Navigator.of(context).pushNamed(UpdateDocket.routeName);
            }
            else{
              Navigator.of(context).pushNamed(PickupDocket.routeName);
            }
          },
          child: Container(
            height: 50,
            width: 370,
            decoration: BoxDecoration(
                color: Color(0xFF20147B),
                borderRadius: BorderRadius.circular(15)
            ),
            child: const Center(
                child: Text("CONTINUE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),)),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25,left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder:(context) {
                        return IconButton(onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                            icon: Icon(Icons.account_circle, size: 35,)
                        );
                      }),
                      Text("Liability with Ability",
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF1C1678)
                        ),),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(NotificationScreen.routeName);
                        },
                        child: Container(
                            height: 35,
                            width: 35,
                            child: Image.asset('assets/jpg_img/Notification.jpg',)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Tell us your service type",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black
                    ),),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Under Pickup",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xFF1C1678)
                    ),),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ChooseProfileContainer(
                      screenName:  () {
                      },
                      value: 1,
                      groupValue: _selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },
                        fontsize: 24,

                        title: 'Track Docket',
                      subTitle:'',
                        img:
                            Padding(
                              padding: const EdgeInsets.only(left: 11,top: 5),
                              child: Image.asset("assets/jpg_img/Track Order.jpg",
                                width: 50,
                                height: 60,),
                            ),

                    ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ChooseProfileContainer(
                        screenName: (){
                        },
                        value: 2,
                        groupValue: _selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                        fontsize: 24,

                        title: 'Update Docket',
                        subTitle:'',
                        img: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6,top: 5),
                              child: Image.asset("assets/jpg_img/UpdateDone.jpg",
                                width: 60,
                                height: 55,),
                            ),
                          ],
                        )
                    ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ChooseProfileContainer(
                      screenName: (){
                      },
                      value: 3,
                      groupValue: _selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },
                      fontsize: 24,

                      title: 'Pickup Docket',
                      subTitle:'',
                      img: Row(
                        children: [
                          Image.asset("assets/jpg_img/Pickup Point2.jpg",
                              width: 40,
                              height: 38,),
                          Image.asset("assets/jpg_img/Public Transportation.jpg",
                            width: 30,
                            height: 68,),
                        ],
                      )
                  ),
                ),

              ],
            ),
      ),
    );
  }
}


        // child: Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   decoration: const BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        //       color: Colors.white),
        //   child: Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: SingleChildScrollView(
        //       child: Column(
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               SizedBox(
        //                   height: queryData.size.height * 0.2,
        //                   child: Container(
        //                       decoration: const BoxDecoration(
        //                         shape: BoxShape.circle,
        //                         color: Colors.white,
        //                         boxShadow: [
        //                           BoxShadow(
        //                             color: Colors.grey,
        //                             blurRadius: 10.0,
        //                             offset: Offset(0, 10),
        //                             spreadRadius: 1,
        //                           ),
        //                         ],
        //                       ),
        //                       child: Image.asset('images/logo/logo.jpg'))),
        //             ],
        //           ),
        //           SizedBox(height: queryData.size.height * 0.02,),
        //           const Text(
        //             "Khimji Poonja Cold Chain Logistic PVT LTD",
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               fontSize: 28,
        //               color: Colors.black
        //             ),
        //           ),
        //           SizedBox(height: queryData.size.height * 0.01,),
        //           const Text(
        //             "Liability With Ability",
        //             style: TextStyle(
        //               fontSize: 18,
        //               color: Colors.black
        //             ),
        //           ),
        //           SizedBox(
        //             height: queryData.size.height * 0.04,
        //           ),
        //           const Text(
        //             "Welcome to Khimji Poonja Cold Chain Logistic PVT LTD",
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               fontSize: 22,
        //               color: Colors.black,
        //               fontWeight: FontWeight.bold
        //             ),
        //           ),
        //           SizedBox(
        //             height: queryData.size.height * 0.03,
        //           ),
        //           const Text(
        //             "Ship and track dockets, packages, \nLearn about our Express logistic services ",
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               fontSize: 16,
        //               color: Colors.black,
        //               fontWeight: FontWeight.bold
        //             ),
        //           ),
        //           SizedBox(
        //             height: queryData.size.height * 0.03,
        //           ),
        //           const Text(
        //             "Select Here",
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               fontSize: 16,
        //               color: Colors.black,
        //               fontWeight: FontWeight.bold
        //             ),
        //           ),
        //           SizedBox(
        //             height: queryData.size.height * 0.03,
        //           ),
        //           SizedBox(
        //             width: double.infinity,
        //             height: queryData.size.height * 0.06,
        //             child: ElevatedButton(
        //               onPressed: ((){
        //                 //Navigator.of(context).pushNamed(TrackDocket.routeName);
        //                 pushNewScreenWithRouteSettings(
        //                   context,
        //                   screen: const ShowDocket(),
        //                   settings: const RouteSettings(name: ShowDocket.routeName)
        //                   );
        //               }),
        //               style: ElevatedButton.styleFrom(
        //                 backgroundColor: const Color(0xFF864879),
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(20.0)
        //                 )
        //               ),
        //               child: const Text(
        //                 "Track Docket ",
        //                 style: TextStyle(
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.w500,
        //                   color: Colors.white
        //                 ),
        //               ),
        //             ),
        //           ),
        //           // SizedBox(
        //           //   height: queryData.size.height * 0.02,
        //           // ),
        //           // SizedBox(
        //           //   width: double.infinity,
        //           //   height: queryData.size.height * 0.06,
        //           //   child: ElevatedButton(
        //           //     onPressed: ((){
        //           //       pushNewScreenWithRouteSettings(
        //           //         context,
        //           //         screen: const QrScannerScreen(),
        //           //         settings: const RouteSettings(name: QrScannerScreen.routeName),
        //           //         withNavBar: false
        //           //       );
        //           //     }),
        //           //     style: ElevatedButton.styleFrom(
        //           //       backgroundColor: const Color(0xFF864879),
        //           //       shape: RoundedRectangleBorder(
        //           //         borderRadius: BorderRadius.circular(20.0)
        //           //       )
        //           //     ),
        //           //     child: const Text(
        //           //       "Scan Docket ",
        //           //       style: TextStyle(
        //           //         fontSize: 18,
        //           //         fontWeight: FontWeight.w500,
        //           //         color: Colors.white
        //           //       ),
        //           //     ),
        //           //   ),
        //           // ),
        //           // SizedBox(
        //           //   height: queryData.size.height * 0.02,
        //           // ),
        //           // SizedBox(
        //           //   width: double.infinity,
        //           //   height: queryData.size.height * 0.06,
        //           //   child: ElevatedButton(
        //           //     onPressed: ((){
        //           //       pushNewScreenWithRouteSettings(
        //           //         context,
        //           //         screen: const DocketDelivery(),
        //           //         settings: const RouteSettings(name: DocketDelivery.routeName)
        //           //       );
        //           //     }),
        //           //     style: ElevatedButton.styleFrom(
        //           //       backgroundColor: const Color(0xFF864879),
        //           //       shape: RoundedRectangleBorder(
        //           //         borderRadius: BorderRadius.circular(20.0)
        //           //       )
        //           //     ),
        //           //     child: const Text(
        //           //       "Docket Delivery",
        //           //       style: TextStyle(
        //           //         fontSize: 18,
        //           //         fontWeight: FontWeight.w500,
        //           //         color: Colors.white
        //           //       ),
        //           //     ),
        //           //   ),
        //           // ),
        //           SizedBox(
        //             height: queryData.size.height * 0.02,
        //           ),
        //           SizedBox(
        //             width: double.infinity,
        //             height: queryData.size.height * 0.06,
        //             child: ElevatedButton(
        //               onPressed: ((){
        //                 //Navigator.of(context).pushNamed(UpdateDocket.routeName);
        //                 pushNewScreenWithRouteSettings(
        //                   context,
        //                   screen: const UpdateDocket(),
        //                   settings: const RouteSettings(name: UpdateDocket.routeName)
        //                 );
        //               }),
        //               style: ElevatedButton.styleFrom(
        //                 backgroundColor: const Color(0xFF864879),
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(20.0)
        //                 )
        //               ),
        //               child: const Text(
        //                 "Update Docket",
        //                 style: TextStyle(
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.w500,
        //                   color: Colors.white
        //                 ),
        //               ),
        //             ),
        //           ),
        //           SizedBox(
        //             height: queryData.size.height * 0.02,
        //           ),
        //           SizedBox(
        //             width: double.infinity,
        //             height: queryData.size.height * 0.06,
        //             child: ElevatedButton(
        //               onPressed: ((){
        //                 //Navigator.of(context).pushNamed(UpdateDocket.routeName);
        //                 pushNewScreenWithRouteSettings(
        //                   context,
        //                   screen: const PickupDocket(),
        //                   settings: const RouteSettings(name: PickupDocket.routeName),
        //                   withNavBar: false
        //                 );
        //               }),
        //               style: ElevatedButton.styleFrom(
        //                 backgroundColor: const Color(0xFF864879),
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(20.0)
        //                 )
        //               ),
        //               child: const Text(
        //                 "Pickup Docket",
        //                 style: TextStyle(
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.w500,
        //                   color: Colors.white
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),