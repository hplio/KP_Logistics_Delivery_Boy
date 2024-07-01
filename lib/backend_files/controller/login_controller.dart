import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:la_logistics/common/full_screen_loder.dart';
import 'package:la_logistics/common/get_snackbar.dart';
import 'package:la_logistics/screens/home_screens.dart';

class LoginCon extends GetxController {
  static LoginCon get instance => Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();

  
  final showPassword = true.obs;
  final String loginUrl = 'http://3.111.47.3:13414/api/v1/DeliveryBoylogin';
  final name = 'Empty'.obs;
  final phoneNumber = 'Empty'.obs;
  final simplePhoneNumber = 'Empty'.obs;
  final id = 'Empty'.obs;
  final dt = 'Empty'.obs;
  final simpleDT = 'Empty'.obs;
  final city = 'Empty'.obs;
  final address = 'Empty'.obs;

  Future<void> logInUser() async {
    KFullScreenLoder.openLodingDialog(
        'Please wait a moment...', 'assets/animation/animation.json');

    try {
      if (!signInKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }
      // Construct the request payload
      final Map<String, String> body = {
        'DeliveryBoyEmail': email.text.trim(),
        'DeliveryBoyPassword': password.text.trim(),
      };

      // Make the POST request
      final http.Response response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      print('code: ${response.statusCode}');
      // Handle the response
      final responseData = jsonDecode(response.body);
      final data = responseData['data'];
      final message = 'You are logged in';
      if (message == responseData['message'].toString()) {
        if (response.statusCode == 200) {
          // Successful login
          id.value = data['DeliveryBoyId'].toString();
          simpleDT.value = data['createdAt'].toString();
          dt.value = simpleDT.value.substring(0, 10) +
              '\n' +
              simpleDT.value.substring(10);
          name.value = data['DeliveryBoyName'].toString();
          address.value = data['DeliveryBoyAddress'].toString();
          final String number = data['DeliveryBoyMobile'].toString();
          simplePhoneNumber.value = number;
          phoneNumber.value = "XXXXXX" + number.substring(6);
          CustomSnackBar.normalSnackBar('Success', 'Login Successful',false);
          KFullScreenLoder.stopLoading();
          if (kDebugMode) {
            print('email: ${email.text}');
            print('password: ${password.text}');
          }
          Get.offAll(() => HomeSCreen());
        }
      } else {
        // Login failed
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData['message']);
        CustomSnackBar.errorSnackBar(
            'failed', 'Login Failed: ${responseData['message']}',false);
        KFullScreenLoder.stopLoading();
        return;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      KFullScreenLoder.stopLoading();
      throw e;
    }
  }
}
