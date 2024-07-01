import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/controller/login_controller.dart';
// import 'package:la_logistics/screens/bottom_nav_bar.dart';
import 'package:la_logistics/screens/home_screens.dart';
import 'package:la_logistics/validators/validator.dart';

class SignInPage extends StatefulWidget {
  static const routeName = "SignInPage";
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controller = Get.put(LoginCon());
  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    // LogInBackend getLogin = Provider.of<LogInBackend>(context);
    // ProviderState providerState = Provider.of<ProviderState>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: queryData.size.height * 0.12,
                ),
    
                //SizedBox(height: queryData.size.height * 0.04,),
                Center(
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C1678)),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.05,
                ),
                Form(
                  key: controller.signInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username or Email ID",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.01,
                      ),
                      TextFormField(
                        validator: (Value) => Kvalidator.validateEmail(Value),
                        controller: controller.email,
                        decoration: InputDecoration(
                            hintText: "you@example.com",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            // labelText: "Username or Email",
                            filled: true,
                            fillColor: Color(0xFFF0F0F0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)))),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.03,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.01,
                      ),
                      Obx(
                        () => TextFormField(
                          validator: (value) =>
                              Kvalidator.validateEmptyText('Password', value),
                          controller: controller.password,
                          obscureText: controller.showPassword.value,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.showPassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  controller.showPassword.value =
                                      !controller.showPassword.value;
                                },
                              ),
                              hintText: "************",
                              hintStyle:
                                  TextStyle(color: Colors.grey.shade400),
                              //labelText: "Password",
                              filled: true,
                              fillColor: Color(0xFFF0F0F0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0)))),
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: queryData.size.height * 0.06,
                        child: ElevatedButton(
                          onPressed: (() {
                            // if(_emailController.text.isNotEmpty && _passController.text.isNotEmpty){
                            //   _lodingSection();
                            //   var result = await getLogin.loginUser(_emailController.text, _passController.text);
                            //   print(result);
                            //   if(result['data'] != null){
                            //     final fbm = FirebaseMessaging.instance;
                            //     String? token = await fbm.getToken();
                            //     print("tpken is $token");
                            //     var update = await getLogin.updateDetails(result['data']['DeliveryBoyId'], token ?? '');
                            //     print("update is $update");
                            //     providerState.mainID = result['data']['_id'];
                            //     providerState.deliveryBoyId = result['data']['DeliveryBoyId'];
                            //     providerState.deliveryBoyName = result['data']['DeliveryBoyName'];
                            //     providerState.deliveryBoyEmail = result['data']['DeliveryBoyEmail'];
                            //     providerState.deliveryBoyMobile = result['data']['DeliveryBoyMobile'];
                            //     providerState.deliveryBoyAddress = result['data']['DeliveryBoyAddress'];
                            //     providerState.deliveyBoyImage = result['data']['file'];
                            //     Navigator.of(context).pop(true);
                            //     Navigator.of(context).pushNamed(BottomNavBarScreen.routeName);
                            //   }else{
                            //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Enter Valid Email And Password")));
                            //   }
                            // }r
                            // Navigator.of(context)
                            //     .pushNamed(HomeSCreen.routeName);
                            controller.logInUser();
                          }),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF20147B),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.01,
                ),
                Center(
                  child: Text(
                    "Privacy Policy - Terms of Use",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C1678)),
                  ),
                ),
    
                // SizedBox(height: queryData.size.height * 0.04,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     RichText(
                //       text: const TextSpan(
                //         children: [
                //         TextSpan(
                //             text: "Don’t have an account?",
                //             style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 16)),
                //         TextSpan(
                //             text: " Sign up",
                //             style: TextStyle(
                //               color: Colors.black,
                //                 fontWeight: FontWeight.w500,
                //                 decoration: TextDecoration.underline,
                //                 fontSize: 16))
                //       ]),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: queryData.size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // lodingSection() {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         //dialogContext = context;
  //         return const Dialog(
  //           insetPadding: EdgeInsets.zero,
  //           elevation: 0,
  //           backgroundColor: Colors.transparent,
  //           child: SizedBox(
  //             height: double.infinity,
  //             width: double.infinity,
  //             child: Center(
  //               child: SpinKitCircle(
  //                 color: Color(0xFF864879),
  //                 size: 100,
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
