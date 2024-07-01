import 'package:country_picker/country_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:la_logistics/screens/otp_screen.dart';

class LoginWithPhone extends StatefulWidget {
  static const routeName = "LoginWithPhone";
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Icon(
                    Icons.headset,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 5, right: 10),
                  child: const Text(
                    "Help",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  "KHIMJI POONJA COLD CHAIN LOGISTIC PVT LTD",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      color: Color(0xFF20147B),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 300,
                width: 350,
                child: Image.asset(
                  'assets/jpg_img/boy.jpg',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 341,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25, left: 15),
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, left: 5),
                        child: Container(
                            height: 25,
                            width: 33,
                            child: Image.asset(
                              'assets/jpg_img/Waving Hand Emoji.jpg',
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "with a valid number, you can access deliveries, and \nothers services",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: phoneController,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                      onChanged: (value) {
                        setState(() {
                          phoneController.text = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Enter phone number",
                        hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              showCountryPicker(
                                  context: context,
                                  countryListTheme: const CountryListThemeData(
                                      bottomSheetHeight: 500),
                                  onSelect: (value) {
                                    setState(() {
                                      selectedCountry = value;
                                    });
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        suffixIcon: phoneController.text.length > 9
                            ? Container(
                                height: 15,
                                width: 15,
                                child: Image.asset(
                                  'assets/jpg_img/Checkmark1.jpg',
                                ))
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpScreen()));
                      // await FirebaseAuth.instance.verifyPhoneNumber(
                      //     verificationCompleted: (PhoneAuthCredential credential) {},
                      // verificationFailed: (FirebaseAuthException e) {},
                      // codeSent: (String verificationid, int? resendtoken) {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(verificationid: verificationid,)));
                      // },
                      //     codeAutoRetrievalTimeout: (String verificationId) {},
                      //   phoneNumber:phoneController.text.toString());
                    },
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Color(0xFF20147B),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                            child: Text(
                          "GET OTP",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
