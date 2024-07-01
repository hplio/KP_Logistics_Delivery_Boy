// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:la_logistics/backend_files/provider_state.dart';
// import 'package:la_logistics/screens/edit_profile_screen.dart';
// import 'package:la_logistics/screens/splash_screen.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:provider/provider.dart';

// class ProfileScreen extends StatefulWidget {
//   static const routeName = "ProfileScreen";
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {

//   FutureOr callSetState(dynamic value){
//     print("calling ittt");
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     var queryData = MediaQuery.of(context);
//     ProviderState providerState = Provider.of<ProviderState>(context);
//     return Scaffold(
//       backgroundColor: const Color(0xFF3F3351),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             width: double.infinity,
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(25), topRight: Radius.circular(25)),
//                   color: Colors.white),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                           height: queryData.size.height * 0.2,
//                           child: Container(
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 10.0,
//                                     offset: Offset(0, 10),
//                                     spreadRadius: 1,
//                                   ),
//                                 ],
//                               ),
//                               child: Image.asset('images/logo/logo.jpg'))),
//                     ],
//                   ),
//                   SizedBox(
//                       height: queryData.size.height * 0.04,
//                     ),
//                     Center(
//                       child: Text(
//                         providerState.deliveryBoyName,
//                         style: const TextStyle(
//                             fontSize: 26,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(height: queryData.size.height * 0.05,),
//                     Row(
//                       children:  [
//                         SizedBox(width: queryData.size.width * 0.05,),
//                         const Text(
//                         "User Id :",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width: queryData.size.width * 0.11,),
//                       Text(
//                         "${providerState.deliveryBoyId}",
//                         style: const TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                         ),
//                       ),
//                       ],
//                     ),
//                     SizedBox(height: queryData.size.height * 0.02,),
//                     Row(
//                       children:  [
//                         SizedBox(width: queryData.size.width * 0.05,),
//                         const Text(
//                         "Full Name :",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width: queryData.size.width * 0.11,),
//                       Text(
//                         providerState.deliveryBoyName,
//                         style: const TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                         ),
//                       ),
//                       ],
//                     ),
//                     SizedBox(height: queryData.size.height * 0.02,),
//                     Row(
//                       children:  [
//                         SizedBox(width: queryData.size.width * 0.05,),
//                         const Text(
//                         "Email Id :",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width: queryData.size.width * 0.15,),
//                       Text(
//                          providerState.deliveryBoyEmail,
//                         style: const TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                         ),
//                       ),
//                       ],
//                     ),
//                     SizedBox(height: queryData.size.height * 0.02,),
//                     Row(
//                       children:  [
//                         SizedBox(width: queryData.size.width * 0.05,),
//                         const Text(
//                         "Mobile Number: ",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width: queryData.size.width * 0.02,),
//                       Text(
//                         "+91 ${ providerState.deliveryBoyMobile}",
//                         style: const TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                         ),
//                       ),
//                       ],
//                     ),
//                     SizedBox(height: queryData.size.height * 0.02,),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children:  [
//                         SizedBox(width: queryData.size.width * 0.05,),
//                         const Text(
//                         "Address: ",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width: queryData.size.width * 0.15,),
//                       Expanded(
//                         child: Text(
//                            providerState.deliveryBoyAddress,
//                           style: const TextStyle(
//                               fontSize: 18,
//                               color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       ],
//                     ),
//                     SizedBox(
//                     height: queryData.size.height * 0.05,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: queryData.size.height * 0.06,
//                     child: ElevatedButton.icon(
//                       onPressed: (){
//                         pushNewScreen(
//                           context,
//                           screen: const SplashScreen(),
//                           withNavBar: false
//                         );
//                       },
//                       icon: const Icon(Icons.power_settings_new_outlined),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF864879),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0)
//                         )
//                       ),
//                       label: const Text(
//                         "Log Out",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white
//                         ),
//                       ),
//                       )),
//                   SizedBox(
//                     height: queryData.size.height * 0.05,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: queryData.size.height * 0.06,
//                     child: ElevatedButton(
//                       onPressed: ((){
//                         pushNewScreenWithRouteSettings(
//                           context,
//                           screen: const EditProfileScreen(),
//                           settings: const RouteSettings(name: EditProfileScreen.routeName)
//                         ).then((callSetState));
//                       }),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF864879),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0)
//                         )
//                       ),
//                       child: const Text(
//                         "Edit Profile",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/controller/login_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 22, 120),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            // Add your back button action here
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MyDialog(); // Custom dialog content
                },
              );
              // Add your edit button action here /profile_edit
              // Navigator.pushReplacementNamed(context, '/profile_edit');
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 28, 22, 120),
      body: UserProfileA(),
    ));
  }
}

class UserProfileA extends StatelessWidget {
  UserProfileA({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginCon());
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: SizedBox(
                      height: 173,
                      width: 174,
                      child: CircleAvatar(
                        radius: 50,
                      ),
                    ),
                  ),
                  Obx(() {
                    return Text(
                      // data.adminName.value,
                      controller.name.value,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    );
                  }),
                  Obx(() {
                    return Text(
                      // data.mobile.value,
                      controller.phoneNumber.value,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    );
                  }),
                  // Text(
                  //   "Purna",
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w500,
                  //       color: Colors.white),
                  // ),

                  // Text(
                  //   "+91 917083579525",
                  //   style: TextStyle(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.white),
                  // )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: ListView(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Full Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Obx(() {
                        return Text(
                          // data.adminName.value,
                          controller.name.value,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }),
                      // Text(
                      //   "Purna",
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black, // specify the color of the divider
                    thickness: 1, // specify the thickness of the divider
                    height: 20, // specify the height of the divider
                    indent: 20, // specify the left indent of the divider
                    endIndent: 20, // specify the right indent of the divider
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Email Id",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Obx(() {
                              return Text(
                                // data.email.value,
                                controller.email.text,
                                // appState.userDetails!.deliveryBoyEmail,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black, // specify the color of the divider
                    thickness: 1, // specify the thickness of the divider
                    height: 20, // specify the height of the divider
                    indent: 20, // specify the left indent of the divider
                    endIndent: 20, // specify the right indent of the divider
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mobile No",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Obx(() {
                        return Text(
                          // data.mobile.value,
                         controller.phoneNumber.value,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }),
                      // Text(
                      //   "+91 7896541235",
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black, // specify the color of the divider
                    thickness: 1, // specify the thickness of the divider
                    height: 20, // specify the height of the divider
                    indent: 20, // specify the left indent of the divider
                    endIndent: 20, // specify the right indent of the divider
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Text(
                      //   "Zenda chowk,Purna",
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      Obx(() {
                        return Text(
                          // data.address.value,
                          controller.address.value,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/Logout.png",
                          height: 27,
                          width: 27,
                        ),
                        const Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 28, 22, 120)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class MyDialog extends StatelessWidget {
  // final controller = Get.put(ApiService());

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController address = TextEditingController();
  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MyDialog({super.key});

  // final api = Get.put(ApiService());
  // ApiService ApiId = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Data'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  // name.text = controller.adminName.value;
                  // return 'Please enter your Name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  // email.text = controller.email.value;
                  // return 'Please enter your Email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: mobileNo,
              decoration: const InputDecoration(labelText: 'Mobile No'),
              validator: (value) {
                if (value!.isEmpty) {
                  // mobileNo.text = controller.mobile.value;
                  // return 'Please enter your Mobile No';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: address,
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value!.isEmpty) {
                  // address.text = controller.address.value;
                  // return 'Please enter your Address';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel")),
        TextButton(
          onPressed: () async {
            // var adminname=name.isBlank?controller.adminName.value:name.text;
            // Handle form submission (e.g., save data)
            // updateDeliveryBoyDetails();
            // Obx((){

            if (_formKey.currentState!.validate()) {
              // print("${controller.adminId.value}, ${name.text}, ${email.text}, ${mobileNo.text}, ${address.text}");
              // await updateProfile(context, controller.adminId.value, name.text, email.text, mobileNo.text, address.text);
              // await controller.fetchAdminOffice(controller.adminId.value);
              Navigator.pop(context);
              // final success = await api.updateDeliveryBoyDetails(
              //     name.text,
              //     email.text.toString(),
              //     mobileNo.text.toString(),
              //     address.text.toString());
              // if (success) {
              //   Navigator.of(context).pop();
              //   // if (!mounted)
              //   //   return; // Check if the widget is still mounted
              //   // Get.offAll(()=>const Service());
              //   // Navigator.pushReplacementNamed(
              //   //     context, '/service');
              // } else {
              //   // if (!mounted)
              //   //   return; // Check if the widget is still mounted
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('Provide Complete Details')),
              //   );
              // }
            }

            //   return Container();
            // });
            // api.updateDeliveryBoyDetails(api.id.value, name.text, email.text, mobileNo.text, address.text);
            // // Close the dialog
            // updateDeliveryBoyDetails(appState.userDetails!.deliveryBoyId.toString(), name.text.toString(), email.text.toString(), mobileNo.text.toString(), address.text.toString());
            // setState(){
            // }
          },
          child: const Text('Submit'),
        ),
      ],
    );
    // }
    // else{
    //   return const Text('No user details available');
    // }
    // },);
  }
}
