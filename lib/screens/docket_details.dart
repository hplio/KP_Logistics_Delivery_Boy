import 'package:flutter/material.dart';

class DocketDetails extends StatefulWidget {
  static const routeName = "DocketDetails";
  const DocketDetails({Key? key}) : super(key: key);

  @override
  State<DocketDetails> createState() => _DocketDetailsState();
}

class _DocketDetailsState extends State<DocketDetails> {
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    Map? args = ModalRoute.of(context)!.settings.arguments as Map;
    print("hehe $args");
    return Scaffold(
      backgroundColor: const Color(0xFF3F3351),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: queryData.size.height,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: args["main"]['data'].isNotEmpty
                ? SingleChildScrollView(
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
                            "Docket Details",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: queryData.size.height * 0.04,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Ship to",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${args["main"]['data'][0]['Customer'][0]['CustomerName']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: queryData.size.height * 0.02,
                                  ),
                                  Text(
                                    "${args["main"]['data'][0]['Customer'][0]['BillingAddress']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: queryData.size.height * 0.02,
                                  ),
                                  Text(
                                    "Mob No: ${args["main"]['data'][0]['Customer'][0]['Mobile']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: queryData.size.height * 0.03,
                                  ),
                                  const Text(
                                    "Ship By",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "LA  Logistic",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: queryData.size.width * 0.02,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Customer Id:",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "\t${args["main"]['data'][0]['Customer'][0]['CustomerId']}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: queryData.size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Docket No:",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "\t${args["main"]['data'][0]['DocketId']}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: queryData.size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Origin : ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "\t${args["origin"]}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: queryData.size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Destinations: ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "\t${args["destination"]}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: queryData.size.height * 0.05),
                        Table(
                          border: TableBorder.all(width: 2, color: Colors.grey),
                          children: [
                            const TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "No. of packing",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Methods of Packing",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Volume(LXBXH)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Box Type",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Temprature",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.all(5.0),
                              //   child: Text(
                              //     "REF",
                              //     style: TextStyle(
                              //       fontSize: 16,
                              //       color: Colors.black,
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.all(5.0),
                              //   child: Text(
                              //     "FRZ",
                              //     style: TextStyle(
                              //       fontSize: 16,
                              //       color: Colors.black,
                              //     ),
                              //   ),
                              // ),
                            ]),
                            for (int i = 0;
                                i <
                                    args["main"]['data'][0]['PackageDetails']
                                        .length;
                                i++) ...[
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    " ${args["main"]['data'][0]['PickupDetails'][0]['NoOfPcs']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    " ",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "${args["main"]['data'][0]['PackageDetails'][i]['Volume']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "${args["main"]['PickupDetails'][0]['PackegeType']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    " ${args["main"]['PackageDetails'][i]['Temperature']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.all(5.0),
                                //   child: Text(
                                //     " ${args["main"]['data'][0]['PackageDetails'][i]['REF']}",
                                //     style: const TextStyle(
                                //       color: Colors.black,
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.all(5.0),
                                //   child: Text(
                                //     " ${args["main"]['data'][0]['PackageDetails'][i]['FRZ']}",
                                //     style: const TextStyle(
                                //       color: Colors.black,
                                //     ),
                                //   ),
                                // ),
                              ]),
                            ],
                          ],
                        ),
                        Table(
                          border: TableBorder.all(width: 2, color: Colors.grey),
                          children: [
                            const TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Packaging /Per Pack ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Dry Ice ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Actual Weight",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Special Instructons ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ]),
                            for (int i = 0;
                                i <
                                    args["main"]['data'][0]['PackageDetails']
                                        .length;
                                i++) ...[
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    " ${args["main"]['data'][0]['PackageDetails'][i]['Pkg']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    " ${args["main"]['data'][0]['PackageDetails'][i]['DRYICE']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    " ${args["main"]['data'][0]['PickupDetails'][0]['GrossWeight']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    " ${args["main"]['data'][0]['PickupDetails'][0]['Remark']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ],
                        ),
                        SizedBox(height: queryData.size.height * 0.05),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Please Scan Correct Qr Code",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
