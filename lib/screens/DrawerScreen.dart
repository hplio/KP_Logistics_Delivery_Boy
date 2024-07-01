import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/controller/login_controller.dart';
import 'package:la_logistics/screens/create_pod.dart';
import 'package:la_logistics/screens/delivery_screen.dart';
import 'package:la_logistics/screens/home_screens.dart';
import 'package:la_logistics/screens/pickup_screen.dart';
import 'package:la_logistics/screens/profile_screen.dart';
import 'package:la_logistics/screens/user_profile.dart';
import 'package:la_logistics/screens/view_pod.dart';

class DrawerScreen extends StatefulWidget {
  static const routeName = "DrawerScreen";

  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginCon());
    return SafeArea(
        child: SizedBox(
      width: 300,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 2,
                    offset: Offset(0, 0.1), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed(UserProfile.routeName);
                        Get.to(() => UserProfile());
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF20147B),
                        child: Text(
                          'V',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.name.value,
                        // "Vishal Singh",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.phoneNumber.value,
                        // 'xxxxxx6204',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/jpg_img/Home.jpg')),
              title: Text('Types of Services'),
              onTap: () {
                Navigator.of(context).pushNamed(HomeSCreen.routeName);
              },
            ),
            ListTile(
              leading: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/jpg_img/Pickup Point.jpg')),
              title: Text('Services under Pickup'),
              onTap: () {
                Navigator.of(context).pushNamed(PickupScreen.routeName);
              },
            ),
            ListTile(
              leading: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/jpg_img/Truck.jpg')),
              title: Text('Services under Delivery'),
              onTap: () {
                Navigator.of(context).pushNamed(DeliveryScreen.routeName);
              },
            ),
            ListTile(
              leading: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/jpg_img/Create.jpg')),
              title: Text('Create POD'),
              onTap: () {
                Navigator.of(context).pushNamed(CreatePod.routeName);
              },
            ),
            ListTile(
              leading: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/jpg_img/View.jpg')),
              title: Text('View POD'),
              onTap: () {
                // Navigator.of(context).pushNamed(ViewPod.routeName);
                Get.to(() => ViewPod());
              },
            ),
            ListTile(
              leading: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/jpg_img/Help.jpg')),
              title: Text('Help'),
              onTap: () {
                // Handle the onTap event
              },
            ),
            ListTile(
              leading: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/jpg_img/Info.jpg')),
              title: Text('About'),
              onTap: () {
                // Handle the onTap event
              },
            ),
            ListTile(
              leading: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/jpg_img/Logout Rounded.jpg')),
              title: Text('Logout'),
              onTap: () {
                // Handle the onTap event
              },
            ),
            // UserAccountsDrawerHeader(
            //   accountName:
            //   Padding(
            //     padding: const EdgeInsets.only(top: 35),
            //     child: Text("Vishal Singh",
            //       style:TextStyle(
            //       fontSize: 22,
            //           fontWeight: FontWeight.bold,
            //         color: Colors.black
            //     ),),
            //   ),
            //   accountEmail: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //      // Text('johndoe@example.com'),
            //       Padding(
            //         padding: const EdgeInsets.only(top: 20),
            //         child: Text('xxxxxx6204',
            //           style:TextStyle(
            //               fontSize: 22,
            //               color: Colors.black
            //           ),),
            //       ),
            //     ],
            //   ),
            //   currentAccountPicture: SizedBox(
            //     height: 20,
            //     width: 20,
            //     child: CircleAvatar(
            //       backgroundColor: Color(0xFF20147B),
            //       child: Text(
            //         'V',
            //         style: TextStyle(fontSize: 20.0,
            //         color: Colors.white),
            //       ),
            //     ),
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //   ),
            // )
          ],
        ),
      ),
    ));
  }
}
