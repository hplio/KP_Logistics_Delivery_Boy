import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/common/full_screen_loder.dart';
import 'package:http/http.dart' as http;
import 'package:la_logistics/common/get_snackbar.dart';
import 'package:la_logistics/screens/docket_updates.dart';

class DocketDetailsController extends GetxController {
  static DocketDetailsController get instance => Get.find();

  final GlobalKey<FormState> docIdFormKey = GlobalKey<FormState>();
  final TextEditingController docId = TextEditingController();
  final dockId = 'Empty'.obs;
  final cId = 'Empty'.obs;
  final rId = 'Empty'.obs;
  final ref = 'Empty'.obs;
  final sId = 'Empty'.obs;
  final cLocation = 'Empty'.obs;

  final String url =
      'http://3.111.47.3:13414/api/v1/docket/SearchDocketDetailsByDocketId';
  Future<void> getDocketDetailesById() async {
    KFullScreenLoder.openLodingDialog(
        'Please wait a moment...', 'assets/animation/animation.json');
    try {
      if (!docIdFormKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }

      final Map<String, dynamic> body = {
        'DocketId': docId.text.trim(),
      };

      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      print('code: ${response.statusCode}');
      final responseData = jsonDecode(response.body);
      print(responseData);
      final data = responseData['data'];
      if (response.statusCode == 200) {
        dockId.value = data['DocketId'].toString();
        cId.value = data['CustomerId'].toString();
        rId.value = data['RequestedId'].toString();
        ref.value = data['Reference'].toString();
        sId.value = data['statusId'].toString();

        KFullScreenLoder.stopLoading();
        Get.to(() => DocketUpdates());
        return;
      } else {
        KFullScreenLoder.stopLoading();
        return;
      }
    } catch (e) {
      KFullScreenLoder.stopLoading();
      CustomSnackBar.errorSnackBar('Failed', 'Oops!! something went wrong',true);
      print('docid det: $e');
    }
  }
}
