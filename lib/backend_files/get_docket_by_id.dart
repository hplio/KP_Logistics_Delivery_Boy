import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetDocketById extends ChangeNotifier {
  Future getDetails(int id) async {
    try {
      Uri url = Uri.parse(
          "http://3.111.47.3:13414/api/v1/docket/SearchDocketDetailsByDocketId");
      http.Response response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(<String, int>{"DocketId": id}));

      var decode = jsonDecode(response.body);
      print(decode.runtimeType);
      return decode;
    } catch (e) {
      return e.toString();
    }
  }

  Future getDocketByBoy(int id) async {
    try {
      Uri url = Uri.parse(
          "http://3.111.47.3:13414/api/v1/getallDocketbyDeliveryBoyId");
      http.Response response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(<String, int>{"DeliveryBoyId": id}));

      var decode = jsonDecode(response.body);
      print(decode.runtimeType);
      return decode;
    } catch (e) {
      return e.toString();
    }
  }

  Future getpickupById(int id) async {
    try {
      Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/getallocationbyDeliveryboyID");

      var response = await http.post(uri,
          headers: {"Content-Type": "application/json"},
          body: json.encode(<String, dynamic>{"DeliveryBoyId": id}));
      var decode = json.decode(response.body);
      return decode;
    } catch (e) {
      return e.toString();
    }
  }

  Future getDocket() async {
    try {
      Uri uriii = Uri.parse(
          "http://3.111.47.3:13414/api/v1/getPickupDetails");

      var response = await http.get(uriii);

      var decode = jsonDecode(response.body);

      return decode;
    } catch (e) {
      return e.toString();
    }
  }

  Future getCity() async {
    try {
      Uri uriii = Uri.parse(
          "http://3.111.47.3:13414/api/v1/getAllCity");

      var response = await http.get(uriii);

      var decode = jsonDecode(response.body);

      return decode;
    } catch (e) {
      return e.toString();
    }
  }

  Future viewPod() async {
    try {
      Uri uriii = Uri.parse(
          "http://3.111.47.3:13414/api/v1/getPodDetails");

      var response = await http.get(uriii);

      var decode = jsonDecode(response.body);

      return decode;
    } catch (e) {
      return e.toString();
    }
  }

  Future createPod(Map<String, dynamic> driverData) async{
    final Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/updatePodDetails");

    try{
      final http.Response response = await http.put(uri,
      headers: {
        "Content-Type":"application/json"
      },
      body: json.encode(driverData)
      );

      final responsebody = json.decode(response.body);

      return responsebody["data"];
    }catch(e){
      rethrow;
    }
  }

  Future getMode() async{
    final Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/getAllmode");

    try{
      final http.Response response = await http.get(uri);
      final responsebody = json.decode(response.body);

      return responsebody["data"];
    }catch(e){
      rethrow;
    }
  }

  Future getBranches() async{
    final Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/officeAdmin/getOfficeAdmin");

    try{
      final http.Response response = await http.get(uri);
      final responsebody = json.decode(response.body);

      return responsebody["data"];
    }catch(e){
      rethrow;
    }
  }

  Future getCustomers() async{
    final Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/customer/getCustomer");

    try{
      final http.Response response = await http.get(uri);

      final responsebody = json.decode(response.body);

      return responsebody["data"];
    }catch(e){
      rethrow;
    }
  }

  Future createPodImage(String id, String path) async{
    try{

      final Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/addImageInPod/PodImage");

      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath(
          "file", path));
      request.fields.addAll({"PodId":id});
      request.headers.addAll({"Content-Type": "application/json"});

      var res = await request.send();

      var response = await http.Response.fromStream(res);

      var decode = jsonDecode(response.body);

      return decode;
    }catch(e){
      rethrow;
    }
  }
}
