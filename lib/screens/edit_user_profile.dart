import 'package:flutter/material.dart';
import 'package:la_logistics/common/cpod_textformfield_row.dart';

class EditUserProfile extends StatefulWidget {
  static const routeName = "EditUserProfile";
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20147B),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  GestureDetector(
                      child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 24,
                  )
                      // onTap: (){
                      //   Navigator.of(context).pushNamed(NotificationScreen.routeName);
                      // },
                      ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Vishal Singh",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
            ),
            Text(
              "+91 7896541235",
              style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 490,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "User ID",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                             
                        Text(
                          "93208",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 30,
                      thickness: 1,
                      //indent: 5,
                      //endIndent: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Full Name",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          "Vishal Singh",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 30,
                      thickness: 1,
                      // indent: 20,
                      // endIndent: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email ID",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          "vishalsingh@gmail.com",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 30,
                      thickness: 1,
                      // indent: 20,
                      // endIndent: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mobile No",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          "+91 7896541235",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 30,
                      thickness: 1,
                      // indent: 20,
                      // endIndent: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          "Dange chowk,Pune",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xFF20147B),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: Text(
                        "UPDATE PROFILE",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
