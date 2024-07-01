import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:la_logistics/backend_files/controller/create_pod_controller.dart';
import 'package:la_logistics/custom/choose_profile_container.dart';
import 'package:la_logistics/screens/DrawerScreen.dart';
import 'package:la_logistics/screens/notification_screen.dart';
import 'package:la_logistics/screens/view_pod.dart';

class DocketPod extends StatefulWidget {
  static const routeName = "DocketPod";
  const DocketPod({super.key});

  @override
  State<DocketPod> createState() => _DocketPodState();
}

class _DocketPodState extends State<DocketPod> {
  bool isSelected = false;

  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CPodController());
    return Scaffold(
      drawer: const DrawerScreen(),
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GestureDetector(
          onTap: () {
            if (_selectedValue == 1) {
              controller.loadData();
            } else {
              // Navigator.of(context).pushNamed(ViewPod.routeName);
              Get.to(ViewPod());
            }
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.account_circle,
                          size: 35,
                        ));
                  }),
                  Text(
                    "Liability with Ability",
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF1C1678)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(NotificationScreen.routeName);
                    },
                    child: Container(
                        height: 35,
                        width: 35,
                        child: Image.asset(
                          'assets/jpg_img/Notification.jpg',
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Tell us your service type",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                " Under Docket POD",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF1C1678)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ChooseProfileContainer(
                  screenName: () {},
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                  fontsize: 24,
                  title: 'Create POD',
                  subTitle: '',
                  img: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Image.asset(
                          "assets/jpg_img/Track Order2.jpg",
                          width: 43,
                          height: 43,
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ChooseProfileContainer(
                  screenName: () {},
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                  fontsize: 24,
                  title: 'View POD',
                  subTitle: '',
                  img: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Image.asset(
                          "assets/jpg_img/Update Done2.jpg",
                          width: 43,
                          height: 43,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
