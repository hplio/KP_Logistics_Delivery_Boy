import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:la_logistics/screens/first_screen.dart';
// import 'package:la_logistics/screens/signin.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "SplashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin? fltNotification;
  Stream<RemoteMessage> stream = FirebaseMessaging.onMessageOpenedApp;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed(FirstScreen.routeName);
    });
    super.initState();
    final fbm = FirebaseMessaging.instance;
    fbm.requestPermission();
    initMessaging();
  }

  void initMessaging() {
    late var data;
    var androiInit = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInit = const DarwinInitializationSettings();
    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
    fltNotification = FlutterLocalNotificationsPlugin();
    fltNotification!.initialize(
      initSetting,
      // onDidReceiveNotificationResponse: (details) {
      //   Navigator.of(context).pushNamed(NotificationScreen.routeName,
      //       arguments: jsonDecode(data["body"]));
      //   print("payload isss ${data}");
      //   print("payload isss ${jsonDecode(data["body"]).runtimeType}");
      // },
    );
    var androidDetails =
        const AndroidNotificationDetails("laLogistic", "laLogistic");
    var iosDetails = const DarwinNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      data = message.data;
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      if (notification != null && android != null) {
        fltNotification!.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var queryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          // child: GestureDetector(
          //   onTap: (){
          //     if(_selectedValue==1){
          //       Navigator.of(context).pushNamed(PickupScreen.routeName);
          //
          //     }else{
          //       Navigator.of(context).pushNamed(DeliveryScreen.routeName);
          //     }
          //   },
          child: Container(
            height: 50,
            width: 370,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: Text(
                "Khimji Poonja Cold Chain Logistic PVT LTD",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      'assets/logo/logo.jpg',
                    ),
                  ),
                ),
              ),

              // SizedBox(
              //   height: queryData.size.height * 0.32,
              // ),
              // Center(
              //   child: const Text(
              //     "Khimji Poonja Cold Chain Logistic PVT LTD",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontSize: 20,
              //         color: Colors.black,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
