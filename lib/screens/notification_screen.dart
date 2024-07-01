import 'package:flutter/material.dart';
import 'package:la_logistics/screens/home_screens.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = "NotificationScreen";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        //spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 0.1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.black,
                        iconSize: 35.0,
                        icon: Icon(Icons.close),
                          onPressed: (){
                            Navigator.of(context).pop(HomeSCreen.routeName);

                          },),
                      Text("Notification",
                      style: TextStyle(fontSize: 22,
                          color: Color(0xFF1C1678)),),
                    ],
                  ),
                ),
                SizedBox(height: 150,),
                Container(
                   height: 100,
                   width: 100,
                   child: Image.asset('images/jpg_img/Notification.jpg',)),
                SizedBox(height: 10,),
                Text("No New Notifications",
                  style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C1678)),),
                SizedBox(height: 10,),
                Center(
                  child: Text("Your recent deliveries, offers and other notifications \n  "
                      "                            will appear here",
                    style: TextStyle(fontSize: 16,
                        color: Color(0xFF1C1678)),),
                ),
              ],
            ),
          ),



    );
  }
}
