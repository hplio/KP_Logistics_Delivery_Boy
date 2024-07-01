import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_logistics/screens/login_with_phone.dart';
import 'package:la_logistics/screens/signin.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = "OtpScreen";
  //String verificationid;
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  String? otpCode;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                    height: 150,
                    width: 170,
                    child: Image.asset(
                      'assets/jpg_img/otpimg.jpg',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Verify Mobile Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Enter the OTP sent to you at 9370846204",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(width: 15,),
                    Text("Edit",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF20147B),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  length: 4,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  onSubmitted: (value){
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 40,),
              Center(
                child: Text("Not received the OTP yet?",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF20147B),
                    )),
              ),
              SizedBox(height: 30,),
              Center(
                child: Text("Resend OTP",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF20147B),
                    )),
              ),
              SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () async{
                  // PhoneAuthCredential credential = await PhoneAuthProvider.credential(
                  //     verificationId: widget.verificationid,
                  //     smsCode: code);
                  // FirebaseAuth.instance.signInWithCredential(credential).then((value){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignInPage()));
                 // });
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
                      "SUBMIT",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
