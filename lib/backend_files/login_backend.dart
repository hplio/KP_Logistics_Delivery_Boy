import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LogInBackend extends ChangeNotifier{

  Future loginUser(String mail, String pass ) async{

    try{
      Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/DeliveryBoylogin");
      var response = await http.post(uri,
      headers: {
        "Content-Type":"application/json"
      },
      body: json.encode(<String, String>{
        "DeliveryBoyEmail": mail,
        "DeliveryBoyPassword": pass
      })
      );

      var decode = jsonDecode(response.body);
      print(decode.runtimeType);
      return decode;
    }catch(e){
     return e.toString();
    }
  }

  Future updateDetails(int id, String noti) async{

    try{
      Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/updateDeliveryBoyDetails");

      var response = await http.put(uri,
      headers: {
        "Content-Type":"application/json"
      },
      body: json.encode(<String, dynamic>{
        "DeliveryBoyId": id,
        "Notification": noti,
      })
      );

      var decode = json.decode(response.body);

      return decode;
    }catch(e){
      return e.toString();
    }
  }

  Future SendDeliveryBoyLocation(int boyId, String lat, String longi) async{
    try{
      Uri mainUri = Uri.parse("https://lalogistics.azurewebsites.net/api/v1/CreateDeliveryBoyMappingDetails");

      var response = await http.post(mainUri,
      body: jsonEncode({
        "DeliveryBoyId":boyId,
        "lattitude":lat,
        "longitude":longi
        }),
        headers: {"Content-Type": "application/json"},
      );
      var decode = jsonDecode(response.body);

      return decode;
    }catch(e){
      return e.toString();
    }
  }

  Future updateDeliveryBoyLocation(int boyId, String lat, String longi, int mainId) async{
    try{
      Uri mainUri = Uri.parse("http://3.111.47.3:13414/api/v1/updateDeliveryBoyMappingDetails");

      var response = await http.put(mainUri,
      body: jsonEncode({
        "DeliveryBoyMappingId":mainId,
        "DeliveryBoyId":boyId,
        "lattitude":lat,
        "longitude":longi
        }),
        headers: {"Content-Type": "application/json"},
      );
      var decode = jsonDecode(response.body);

      return decode;
    }catch(e){
      return e.toString();
    }
  }
}