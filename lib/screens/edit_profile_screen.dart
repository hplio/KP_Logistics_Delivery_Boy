import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_logistics/backend_files/update_profile_backend.dart';
import 'package:provider/provider.dart';

import '../backend_files/provider_state.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "EditProfileScreen";
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _nameController    = "";
  String _emailCOntroller   = "";
  int _mobileController  =  0;
  String _addressController = "";



  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    ProviderState providerState = Provider.of<ProviderState>(context);
    UpdateProfileBackend _updateProfile = Provider.of<UpdateProfileBackend>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF3F3351),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: queryData.size.height,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: queryData.size.height * 0.2,
                        width: queryData.size.width * 0.4,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                offset: Offset(0, 10),
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child:Image.asset('images/logo/logo.jpg')
                          ),
                    ],
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.04,
                  ),
                  TextFormField(
                    //controller: _myController,
                    readOnly: true,
                    initialValue: providerState.deliveryBoyId.toString(),
                    decoration: const InputDecoration(
                        labelText: "Enter Id",
                        filled: true,
                        fillColor: Color(0xFFF0F0F0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  ),
                  SizedBox(height: queryData.size.height * 0.02,),
                  TextFormField(
                    //controller: _nameController,
                    initialValue: providerState.deliveryBoyName,
                    onChanged: (value){
                      setState(() {
                        _nameController = value;
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Full Name",
                        filled: true,
                        fillColor: Color(0xFFF0F0F0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  ),
                  SizedBox(height: queryData.size.height * 0.02,),
                  TextFormField(
                    //controller: _emailCOntroller,
                    initialValue: providerState.deliveryBoyEmail,
                    onChanged: (value){
                      setState(() {
                        _emailCOntroller = value;
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Email Id",
                        filled: true,
                        fillColor: Color(0xFFF0F0F0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  ),
                  SizedBox(height: queryData.size.height * 0.02,),
                  TextFormField(
                    //controller: _mobileController,
                    initialValue: providerState.deliveryBoyMobile.toString(),
                    onChanged: (value){
                      setState(() {
                        _mobileController = int.parse(value);
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Mobile Number",
                        filled: true,
                        fillColor: Color(0xFFF0F0F0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  ),
                  SizedBox(height: queryData.size.height * 0.02,),
                  TextFormField(
                    //controller: _addressController,
                    initialValue: providerState.deliveryBoyAddress,
                    onChanged: (value){
                      setState(() {
                        _addressController = value;
                      });
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Address",
                        filled: true,
                        fillColor: Color(0xFFF0F0F0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  ),
                  SizedBox(height: queryData.size.height * 0.04,),
                  SizedBox(
                            width: double.infinity,
                            height: queryData.size.height * 0.06,
                            child: ElevatedButton(
                              onPressed: (() async{
                                if(_nameController.isEmpty){
                                  _nameController = providerState.deliveryBoyName;
                                }
                                if(_emailCOntroller.isEmpty){
                                  _emailCOntroller = providerState.deliveryBoyEmail;
                                }
                                if(_mobileController ==0){
                                  _mobileController = providerState.deliveryBoyMobile;
                                }
                                if(_addressController.isEmpty){
                                  _addressController = providerState.deliveryBoyAddress;
                                }
                                var result = await _updateProfile.updateDetails(providerState.deliveryBoyId, 
                                _nameController, _emailCOntroller, _mobileController, _addressController);
                                providerState.deliveryBoyName = result['data']['DeliveryBoyName'];
                                providerState.deliveryBoyEmail = result['data']['DeliveryBoyEmail'];
                                providerState.deliveryBoyMobile = result['data']['DeliveryBoyMobile'];
                                providerState.deliveryBoyAddress = result['data']['DeliveryBoyAddress'];
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Profile Updated Successfully!"))
                                );
                                print("hui hui $result");
                              }),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF864879),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0))),
                              child: const Text(
                                "Update Profile",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
