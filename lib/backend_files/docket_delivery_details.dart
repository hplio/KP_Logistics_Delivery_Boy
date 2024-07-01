import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DocketDeliveyDetails extends ChangeNotifier{

  Future updateDocketDeliveryDetails(int id, String name, int mobile, String date, String time) async{

    try{

      Uri _uri = Uri.parse("http://3.111.47.3:13414/api/v1/createPodDetails");

      var response = await http.post(_uri,
      headers: {
        "Content-Type":"application/json"
      },
      body: json.encode(<String, dynamic>{
        "GRId":id,
        "ReceivedBy":name,
        "ReceiverMobile":mobile,
        "DeliveryDate":date,
        "DeliveryTime":time
      })
      );

      var decode = json.decode(response.body);

      return decode;

    }catch(e){
      return e.toString();
    }
  }
}