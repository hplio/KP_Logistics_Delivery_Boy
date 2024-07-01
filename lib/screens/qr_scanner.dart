// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:la_logistics/backend_files/get_docket_by_id.dart';
import 'package:la_logistics/screens/docket_details.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  static const routeName = "QrScannerScreen";
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final qrKey = GlobalKey(debugLabel: "QR");

  //QRViewController? _controller;

  @override
  void dispose() {
    // TODO: implement dispose
    //_controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetDocketById getDocket = Provider.of<GetDocketById>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF3F3351),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Colors.white),
            child: MobileScanner(
              allowDuplicates: false,
              onDetect: (barcode, args) async {
                var result =
                    await getDocket.getDetails(int.parse(barcode.rawValue!));
                var cityMap = await getDocket.getCity();
                print(cityMap["data"][0]["Cityid"].runtimeType);
                String origin = "";
                String destination = "";
                for (var element in cityMap["data"]) {
                  if (element["Cityid"].compareTo(
                          result["data"][0]["PickupDetails"][0]["OriginId"]) ==
                      0) {
                    origin = element["City"];
                  }
                  if (element["Cityid"].compareTo(result["data"][0]
                          ["PickupDetails"][0]["DestinationId"]) ==
                      0) {
                    destination = element["City"];
                  }
                }
                print(result);
                Navigator.of(context)
                    .pushReplacementNamed(DocketDetails.routeName, arguments: {
                  "main": result,
                  "origin": origin,
                  "destination": destination
                });
                // pushNewScreenWithRouteSettings(
                //   context,
                //   screen: const DocketDetails(),
                //   settings: RouteSettings(name: DocketDetails.routeName,arguments: result),
                //   withNavBar: true
                //   );
                print("hui hui ${barcode.rawValue},, $args");
              },
            )),
      ),
    );
  }
  // Widget buildQrView(BuildContext context){
  //   return QRView(
  //     key: qrKey,
  //     onQRViewCreated: onQRViewCreated,
  //     overlay: QrScannerOverlayShape(
  //       borderColor: const Color(0xFF3F3351),
  //       borderRadius: 20,
  //       borderLength: 20,
  //       borderWidth: 10,
  //       cutOutSize: MediaQuery.of(context).size.width * 0.8
  //     ),
  //   );
  // }

  // void onQRViewCreated(QRViewController controller){
  //   setState(() {
  //     this._controller = controller;
  //   });
  // }
}
