import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateProfileBackend extends ChangeNotifier{

  Future updateDetails(int id, String name, String email, int mobile, String address) async{

    try{
      Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/updateDeliveryBoyDetails");

      var response = await http.put(uri,
      headers: {
        "Content-Type":"application/json"
      },
      body: json.encode(<String, dynamic>{
        "DeliveryBoyId": id,
        "DeliveryBoyName": name,
        "DeliveryBoyEmail": email,
        "DeliveryBoyMobile": mobile,
        "DeliveryBoyAddress": address,
      })
      );

      var decode = json.decode(response.body);

      return decode;
    }catch(e){
      return e.toString();
    }
  }
}