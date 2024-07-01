import 'package:flutter/material.dart';
import 'package:la_logistics/screens/login_with_phone.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = "FirstScreen";
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginWithPhone()));
          },
          child: Container(
            height: 50,
            width: 320,
            decoration: BoxDecoration(
                color: Color(0xFF20147B),
                borderRadius: BorderRadius.circular(15)),
            child: const Center(
                child: Text(
              "NEXT",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 250,
                color: Colors.white,
                width: 350,
                child: Image.asset(
                  'assets/jpg_img/homepg.jpg',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: const Text(
              "W e l c o m e",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF1C1678),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: const Text(
              "To",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF1C1678),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: const Text(
              "Khimji Poonja Cold Chain Logistic PVT LTD",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF1C1678),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: const Text(
              "You can send items, track and be \ncourier in this application",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF20147B),
                  fontWeight: FontWeight.bold),
            ),
          ),
          // SizedBox(
          //   height: 180,
          // ),
          // InkWell(
          //   onTap: (){
          //   },
          //   child: Center(
          //     child: Container(
          //       height: 50,
          //       width: 350,
          //       decoration: BoxDecoration(
          //           color: Color(0xFF1C1678),
          //           borderRadius: BorderRadius.circular(15)
          //       ),
          //       child: const Center(
          //           child: Text("NEXT",
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 20
          //             ),)),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
