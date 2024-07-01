import 'package:flutter/material.dart';

class ScanDocket extends StatefulWidget {
  static const routeName = "ScanDocket";
  const ScanDocket({Key? key}) : super(key: key);

  @override
  State<ScanDocket> createState() => _ScanDocketState();
}

class _ScanDocketState extends State<ScanDocket> {
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF3F3351),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.chevron_left),
              ),
              SizedBox(
                height: queryData.size.height * 0.04,
              ),
              const Center(
                child: Text(
                  "Scan Docket",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: queryData.size.height * 0.03,
              ),
              Container(
                width: double.infinity,
                height: queryData.size.height * 0.65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color(0x80C4C4C4)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "Scan the Barcode ",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.02,
                      ),
                      const Text(
                        "Line Up the barcode inside the corners and keep the phone steady  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0x80000000),
                        ),
                      ),
                      SizedBox(height: queryData.size.height * 0.03),
                      Image.asset("assates/logo/scan.png"),
                      const Expanded(child: SizedBox()),
                      const Text(
                        "Scanning ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(height: queryData.size.height * 0.03),
                      Image.asset("assates/logo/loading.png"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
