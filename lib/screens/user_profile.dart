import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/controller/login_controller.dart';
import 'package:la_logistics/backend_files/controller/profile_controller.dart';
import 'package:la_logistics/validators/validator.dart';

class UserProfile extends StatefulWidget {
  static const routeName = "UserProfile";

  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginCon());
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
                      onTap: () {
                        Get.to(() => MyDialog());
                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 24,
                      )),
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
              controller.name.value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
            ),
            Text(
              "+91 ${controller.simplePhoneNumber.value}",
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
                          controller.id.value,
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
                          controller.name.value,
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
                          controller.email.text,
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
                          "+91 ${controller.simplePhoneNumber.value}",
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
                          softWrap: true,
                          controller.address.value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ListTile(
                        leading: Container(
                            height: 25,
                            width: 25,
                            child: Image.asset('assets/jpg_img/Logout.jpg')),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF1C1678),
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          // Handle the onTap event
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyDialog extends StatelessWidget {
  MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEditController());
    return AlertDialog(
      title: const Text('Add Data'),
      content: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller.name,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) => Kvalidator.validateEmptyText('Name', value),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => Kvalidator.validateEmail(value),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.mobileNo,
              decoration: const InputDecoration(labelText: 'Mobile No'),
              validator: (value) =>
                  Kvalidator.validateEmptyText('Mobile no', value),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.address,
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (value) =>
                  Kvalidator.validateEmptyText('Address', value),
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
          onPressed: () {
            Get.back();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
