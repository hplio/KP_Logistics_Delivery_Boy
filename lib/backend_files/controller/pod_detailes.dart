import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:la_logistics/backend_files/json_2/pod_details_response.dart';

class PodDetailesController extends GetxController {
  static PodDetailesController get instance => Get.find();

  Future<PodDetailsResponse> fetchPodDetails() async {
    final response = await http
        .get(Uri.parse('http://3.111.47.3:13414/api/v1/getPodDetails'));

    if (response.statusCode == 200) {
      return PodDetailsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load POD details');
    }
  }
}
