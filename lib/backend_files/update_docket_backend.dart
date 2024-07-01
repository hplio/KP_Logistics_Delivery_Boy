import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateDocketBackend extends ChangeNotifier{


  Future updatingDocket(int docketId, int statusId, String currentlocation, String status)async{

    try{
      Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/CreateStatus");

      var response = await http.post(uri,
      headers: {
        "Content-Type":"application/json"
      },
      body: json.encode(<String, dynamic>{
        "DocketId": docketId,
        "statusId": statusId,
        "Status": status,
        "Currentlocation": currentlocation
      })
      );
      var decode = json.decode(response.body);
      return decode;
    }catch(e){
      return e.toString();
    }
  }


  Future updatePickup(int id, String pickup, String date, String time, String weight, String pieces)async{

    try{
      Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/updatePickupDetails");

      var response = await http.put(uri,
      headers: {
        "Content-Type":"application/json"
      },
      body: json.encode(<String, dynamic>{
        "RequestedId": id,
        "IsPickupRecived": pickup,
        "GrossWeight": weight,
        "NoOfPcs": int.parse(pieces),
        "Date": date,
        "PickupTime": time
      })
      );
      var decode = json.decode(response.body);
      return decode;
    }catch(e){
      return e.toString();
    }
  }

  Future createManifest(int id) async {
    try {
      Uri uri = Uri.parse("http://3.111.47.3:13414/api/v1/CreateMenifestDetails");

      var response = await http.post(uri,
          headers: {"Content-Type": "application/json"},
          body: json.encode(<String, dynamic>{"DocketId": id}));
      var decode = json.decode(response.body);
      return decode;
    } catch (e) {
      return e.toString();
    }
  }
}