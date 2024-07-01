import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/controller/login_controller.dart';

class DocketUpdates extends StatefulWidget {
  static const routeName = "DocketUpdates";
  const DocketUpdates({Key? key}) : super(key: key);

  @override
  State<DocketUpdates> createState() => _DocketUpdatesState();
}

class _DocketUpdatesState extends State<DocketUpdates> {
  // TextEditingController _myController = TextEditingController();
  // int indecies = 0;
  // List docketlist = [
  //   "Docket Created",
  //   "Docket Pickup",
  //   "Docket Shipped",
  //   "Docket Received at",
  //   "Docket Delivered"
  // ];
  // String mainDocket = "Docket Created";
  //
  // _dropDownWidget() {
  //   return DropdownButton<String>(
  //     isExpanded: true,
  //     value: mainDocket,
  //     icon: const Icon(
  //       Icons.keyboard_arrow_down_sharp,
  //       color: Color(0xFF9A3B81),
  //     ),
  //     elevation: 16,
  //     onChanged: (String? newVal) {
  //       setState(() {
  //         mainDocket = newVal!;
  //         indecies = docketlist.indexOf(mainDocket) + 1;
  //       });
  //     },
  //     items: docketlist.map<DropdownMenuItem<String>>((value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //   );
  // }

  var list = [
    {'name': "No of Packing", "data": "33"},
    {'name': "Methods of\nPacking", "data": "-"},
    {'name': "Volume (L*B*H)", "data": "55*12*18"},
    {'name': "Box Type", "data": "Round Box"},
    {'name': "AMB", "data": "Null"},
    {'name': "REF", "data": "Null"},
    {'name': "FRZ", "data": "Null"},
    {'name': "Packaging/\nPer Pack", "data": "15"},
    {'name': "Dry Ice", "data": "-"},
    {'name': "Actual Wt", "data": "435"},
    {'name': "Special\nInstructions", "data": "N/A"},
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginCon());
    // var queryData = MediaQuery.of(context);
    // Map? args = ModalRoute.of(context)!.settings.arguments as Map;
    // log('my logs are ${args}');
    // UpdateDocketBackend _updateDocket =
    //     Provider.of<UpdateDocketBackend>(context);
    // print(args);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        )),
                    Text(
                      "Docket Update",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF1C1678)),
                    ),
                    Container(
                        height: 35,
                        width: 35,
                        child: Image.asset(
                          'assets/jpg_img/Info1.jpg',
                        )),
                  ],
                ),
              ),
              Text(
                '#${controller.id.value}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF1C1678)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(width: 1, color: Color(0xFF1C1678))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              child:
                                  Image.asset('assets/jpg_img/Delivery1.jpg')),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Ship to',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            controller.name.value,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              child: Image.asset('assets/jpg_img/Home1.jpg')),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Address',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            softWrap: true,
                            'Hello',
                            // '${controller.address.value.substring(0, 6)}\n${controller.address.value.substring(6)}',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              child: Image.asset('assets/jpg_img/User.jpg')),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Mob No',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            controller.simplePhoneNumber.value,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                  'assets/jpg_img/ID Verified.jpg')),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Customer ID',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '60695',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              child: Image.asset('assets/jpg_img/Docket.jpg')),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Docket No',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Text(
                            controller.id.value,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                  'assets/jpg_img/destination 1.jpg')),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Origin\nDestination',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Nagpur\nAurangabad',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(width: 1, color: Color(0xFF1C1678))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ship By",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " LA LOGISTICS",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF20147B),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Table(
                border: TableBorder.all(
                  width: 3,
                  color: Color(0xFF20147B),
                  borderRadius: BorderRadius.circular(15),
                ),
                columnWidths: {
                  0: FixedColumnWidth(130),
                  1: FixedColumnWidth(200)
                },
                children: [
                  for (var item in list)
                    TableRow(children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(item['name']!),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            item['data']!,
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF1C1678)),
                          ),
                        ),
                      )
                    ])
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Docket Status",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFF1C1678))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Text(
                            "Docket Created",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF1C1678)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.expand_more,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Current\nLocation",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF1C1678),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Color(0xFF20147B),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    "UPDATE DOCKET",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        // child: Container(
        //   width: double.infinity,
        //   height: queryData.size.height,
        //   decoration: const BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        //       color: Colors.white),
        //   child: Padding(
        //     padding: const EdgeInsets.all(20.0),
        //     child: args["main"]['data'].isNotEmpty
        //         ? SingleChildScrollView(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 IconButton(
        //                   onPressed: () => Navigator.of(context).pop(),
        //                   icon: const Icon(Icons.chevron_left),
        //                 ),
        //                 SizedBox(
        //                   height: queryData.size.height * 0.04,
        //                 ),
        //                 const Center(
        //                   child: Text(
        //                     "Docket Updates",
        //                     style: TextStyle(
        //                         fontSize: 26,
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: queryData.size.height * 0.04,
        //                 ),
        //                 Row(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Expanded(
        //                       child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           const Text(
        //                             "Ship to",
        //                             style: TextStyle(
        //                                 fontSize: 22,
        //                                 color: Colors.black,
        //                                 fontWeight: FontWeight.bold),
        //                           ),
        //                           Text(
        //                             "${args["main"]['data'][0]['Customer'][0]['CustomerName']}",
        //                             style: const TextStyle(
        //                               fontSize: 18,
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             height: queryData.size.height * 0.02,
        //                           ),
        //                           Text(
        //                             "${args["main"]['data'][0]['Customer'][0]['BillingAddress']}",
        //                             style: const TextStyle(
        //                               fontSize: 16,
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             height: queryData.size.height * 0.02,
        //                           ),
        //                           Text(
        //                             "Mob No: ${args["main"]['data'][0]['Customer'][0]['Mobile']}",
        //                             style: const TextStyle(
        //                               fontSize: 16,
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             height: queryData.size.height * 0.03,
        //                           ),
        //                           const Text(
        //                             "Ship By",
        //                             style: TextStyle(
        //                                 fontSize: 22,
        //                                 color: Colors.black,
        //                                 fontWeight: FontWeight.bold),
        //                           ),
        //                           const Text(
        //                             "LA  Logistic",
        //                             style: TextStyle(
        //                                 fontSize: 22,
        //                                 color: Colors.black,
        //                                 fontWeight: FontWeight.bold),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       width: queryData.size.width * 0.02,
        //                     ),
        //                     Expanded(
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Row(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               const Text(
        //                                 "Customer Id:",
        //                                 style: TextStyle(
        //                                     fontSize: 16,
        //                                     color: Colors.black,
        //                                     fontWeight: FontWeight.w600),
        //                               ),
        //                               Flexible(
        //                                 child: Text(
        //                                   "\t${args["main"]['data'][0]['Customer'][0]['CustomerId']}",
        //                                   style: const TextStyle(
        //                                     fontSize: 16,
        //                                     color: Colors.black,
        //                                   ),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                           SizedBox(
        //                             height: queryData.size.height * 0.02,
        //                           ),
        //                           Row(
        //                             children: [
        //                               const Text(
        //                                 "Docket No:",
        //                                 style: TextStyle(
        //                                     fontSize: 16,
        //                                     color: Colors.black,
        //                                     fontWeight: FontWeight.w600),
        //                               ),
        //                               Text(
        //                                 "\t${args["main"]['data'][0]['DocketId']}",
        //                                 style: const TextStyle(
        //                                   fontSize: 16,
        //                                   color: Colors.black,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                           SizedBox(
        //                             height: queryData.size.height * 0.02,
        //                           ),
        //                           Row(
        //                             children: [
        //                               Text(
        //                                 "Origin : ",
        //                                 style: TextStyle(
        //                                   fontSize: 16,
        //                                   fontWeight: FontWeight.w600,
        //                                   color: Colors.black,
        //                                 ),
        //                               ),
        //                               Text(
        //                                 "\t${args["origin"]}",
        //                                 style: TextStyle(
        //                                   fontSize: 14,
        //                                   color: Colors.black,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                           SizedBox(
        //                             height: queryData.size.height * 0.02,
        //                           ),
        //                           Row(
        //                             children: [
        //                               Text(
        //                                 "Destinations: ",
        //                                 style: TextStyle(
        //                                   fontSize: 16,
        //                                   fontWeight: FontWeight.w600,
        //                                   color: Colors.black,
        //                                 ),
        //                               ),
        //                               Text(
        //                                 "\t${args["destination"]}",
        //                                 style: TextStyle(
        //                                   fontSize: 14,
        //                                   color: Colors.black,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                           // SizedBox(
        //                           //   height: queryData.size.height * 0.04,
        //                           // ),
        //                         ],
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //                 SizedBox(height: queryData.size.height * 0.05),
        //                 Table(
        //                   border: TableBorder.all(width: 2, color: Colors.grey),
        //                   children: [
        //                     const TableRow(children: [
        //                       Padding(
        //                         padding: EdgeInsets.all(5.0),
        //                         child: Text(
        //                           "No. of pcs",
        //                           style: TextStyle(
        //                             fontSize: 16,
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.all(5.0),
        //                         child: Text(
        //                           "Temprature Type",
        //                           style: TextStyle(
        //                             fontSize: 16,
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.all(5.0),
        //                         child: Text(
        //                           "Volume(LXBXH)",
        //                           style: TextStyle(
        //                             fontSize: 16,
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.all(5.0),
        //                         child: Text(
        //                           "Box Type",
        //                           style: TextStyle(
        //                             fontSize: 16,
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.all(5.0),
        //                         child: Text(
        //                           "Temprature",
        //                           style: TextStyle(
        //                             fontSize: 16,
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                       // Padding(
        //                       //   padding: EdgeInsets.all(5.0),
        //                       //   child: Text(
        //                       //     "REF",
        //                       //     style: TextStyle(
        //                       //       fontSize: 16,
        //                       //       color: Colors.black,
        //                       //     ),
        //                       //   ),
        //                       // ),
        //                       // Padding(
        //                       //   padding: EdgeInsets.all(5.0),
        //                       //   child: Text(
        //                       //     "FRZ",
        //                       //     style: TextStyle(
        //                       //       fontSize: 16,
        //                       //       color: Colors.black,
        //                       //     ),
        //                       //   ),
        //                       // ),
        //                     ]),
        //                     for (int i = 0;
        //                         i <
        //                             args["main"]['data'][0]['PackageDetails']
        //                                 .length;
        //                         i++) ...[
        //                       TableRow(children: [
        //                         Padding(
        //                           padding: const EdgeInsets.all(5.0),
        //                           child: Text(
        //                             " ${args["main"]['data'][0]['PickupDetails'][0]['NoOfPcs']}",
        //                             style: const TextStyle(
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                         ),
        //                         Padding(
        //                           padding: EdgeInsets.all(5.0),
        //                           child: Text(
        //                             args["main"]['data'][0]['PackageDetails'][i]['TemperatureTypeId'] == 1
        //                             ? "AMB"
        //                             : args["main"]['data'][0]['PackageDetails'][i]['TemperatureTypeId'] == 2
        //                             ? "REF"
        //                             : args["main"]['data'][0]['PackageDetails'][i]['TemperatureTypeId'] == 3
        //                             ? "FRZ"
        //                             : "Other",
        //                             style: TextStyle(
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                         ),
        //                         Padding(
        //                           padding: const EdgeInsets.all(5.0),
        //                           child: Text(
        //                             "${args["main"]['data'][0]['PackageDetails'][i]['Volume']}",
        //                             style: const TextStyle(
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                         ),
        //                         Padding(
        //                           padding: const EdgeInsets.all(5.0),
        //                           child: Text(
        //                             "${args["main"]["data"][0]['PickupDetails'][0]['PackegeType']}",
        //                             style: const TextStyle(
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                         ),
        //                         Padding(
        //                           padding: const EdgeInsets.all(5.0),
        //                           child: Text(
        //                             " ${args["main"]["data"][0]['PackageDetails'][i]['Temperature']}",
        //                             style: const TextStyle(
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                         ),
        //                         // Padding(
        //                         //   padding: EdgeInsets.all(5.0),
        //                         //   child: Text(
        //                         //     " ${args["main"]['data'][0]['PackageDetails'][i]['REF']}",
        //                         //     style: const TextStyle(
        //                         //       color: Colors.black,
        //                         //     ),
        //                         //   ),
        //                         // ),
        //                         // Padding(
        //                         //   padding: const EdgeInsets.all(5.0),
        //                         //   child: Text(
        //                         //     " ${args["main"]['data'][0]['PackageDetails'][i]['FRZ']}",
        //                         //     style: const TextStyle(
        //                         //       color: Colors.black,
        //                         //     ),
        //                         //   ),
        //                         // ),
        //                       ]),
        //                     ],
        //                   ],
        //                 ),
        //                 Table(
        //                   border: TableBorder.all(width: 2, color: Colors.grey),
        //                   children: [
        //                     const TableRow(children: [
        //                       Padding(
        //                         padding: EdgeInsets.all(5.0),
        //                         child: Text(
        //                           "Packaging /Per Pack ",
        //                           style: TextStyle(
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.all(5.0),
        //                         child: Text(
        //                           "Volumetrix",
        //                           style: TextStyle(
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.all(5.0),
        //                         child: Text(
        //                           "Actual Weight",
        //                           style: TextStyle(
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.all(5.0),
        //                         child: Text(
        //                           "Special Instructons ",
        //                           style: TextStyle(
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                     ]),
        //                     for (int i = 0;
        //                         i <
        //                             args["main"]['data'][0]['PackageDetails']
        //                                 .length;
        //                         i++) ...[
        //                       TableRow(children: [
        //                         Padding(
        //                           padding: const EdgeInsets.all(5.0),
        //                           child: Text(
        //                             " ${args["main"]['data'][0]['PackageDetails'][i]['Pkg']}",
        //                             style: const TextStyle(
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                         ),
        //                         Padding(
        //                           padding: const EdgeInsets.all(5.0),
        //                           child: Text(
        //                             " ${args["main"]['data'][0]['PackageDetails'][i]['Volumetrix']}",
        //                             style: const TextStyle(
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                         ),
        //                         Padding(
        //                           padding: const EdgeInsets.all(5.0),
        //                           child: Text(
        //                             " ${args["main"]['data'][0]['PickupDetails'][0]['GrossWeight']}",
        //                             style: const TextStyle(
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                         ),
        //                         Padding(
        //                           padding: const EdgeInsets.all(5.0),
        //                           child: Text(
        //                             " ${args["main"]['data'][0]['PickupDetails'][0]['Remark']}",
        //                             style: const TextStyle(
        //                               color: Colors.black,
        //                             ),
        //                           ),
        //                         ),
        //                       ]),
        //                     ],
        //                   ],
        //                 ),
        //                 SizedBox(height: queryData.size.height * 0.05),
        //                 Container(
        //                   height: queryData.size.height * 0.35,
        //                   width: double.infinity,
        //                   decoration: BoxDecoration(
        //                       border: Border.all(
        //                           width: 2, color: const Color(0x40000000))),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(20.0),
        //                     child: Column(
        //                       children: [
        //                         Row(
        //                           children: [
        //                             const Text(
        //                               "Docket Status",
        //                               style: TextStyle(
        //                                   color: Colors.black, fontSize: 16),
        //                             ),
        //                             SizedBox(
        //                               width: queryData.size.width * 0.03,
        //                             ),
        //                             Expanded(
        //                               child: Container(
        //                                 height: queryData.size.height * 0.08,
        //                                 width: double.infinity,
        //                                 decoration: BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(10),
        //                                     color: Colors.white70,
        //                                     border: Border.all(
        //                                         width: 2,
        //                                         color: Color(0xFF89909F)),
        //                                     boxShadow: const [
        //                                       BoxShadow(
        //                                           color: Colors.black12,
        //                                           offset: Offset(0, 3),
        //                                           blurRadius: 8.0,
        //                                           spreadRadius: 2.0),
        //                                     ]),
        //                                 child: Padding(
        //                                   padding: const EdgeInsets.all(15.0),
        //                                   child: _dropDownWidget(),
        //                                 ),
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                         SizedBox(
        //                           height: queryData.size.height * 0.03,
        //                         ),
        //                         Row(
        //                           children: [
        //                             const Text(
        //                               "Current Location ",
        //                               style: TextStyle(
        //                                   color: Colors.black, fontSize: 16),
        //                             ),
        //                             SizedBox(
        //                               width: queryData.size.width * 0.03,
        //                             ),
        //                             Expanded(
        //                               child: TextFormField(
        //                                 controller: _myController,
        //                                 decoration: const InputDecoration(
        //                                     labelText: "Enter Current Location",
        //                                     filled: true,
        //                                     fillColor: Color(0xFFF0F0F0),
        //                                     border: OutlineInputBorder(
        //                                         borderRadius: BorderRadius.all(
        //                                             Radius.circular(15.0)))),
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                         SizedBox(
        //                           height: queryData.size.height * 0.03,
        //                         ),
        //                         SizedBox(
        //                           width: double.infinity,
        //                           height: queryData.size.height * 0.06,
        //                           child: ElevatedButton(
        //                             onPressed: (() async {
        //                               if (_myController.text.isNotEmpty) {
        //                                 var result =
        //                                     await _updateDocket.updatingDocket(
        //                                         args["main"]['data'][0]
        //                                             ['DocketId'],
        //                                         indecies,
        //                                         _myController.text,
        //                                         mainDocket);
        //                                 if (result['success'] == true &&
        //                                     result['data'] != null) {
        //                                   ScaffoldMessenger.of(context)
        //                                       .showSnackBar(const SnackBar(
        //                                           content: Text(
        //                                               "Docket Delivery Details Added Successfully")));
        //                                 } else {
        //                                   ScaffoldMessenger.of(context)
        //                                       .showSnackBar(const SnackBar(
        //                                           content: Text(
        //                                               "Please Enter Correct Details")));
        //                                 }
        //                                 print("huihui $result");
        //                                 setState(() {
        //                                   indecies = 0;
        //                                   _myController.clear();
        //                                 });
        //                               }
        //                             }),
        //                             style: ElevatedButton.styleFrom(
        //                                 backgroundColor: const Color(0xFF864879),
        //                                 shape: RoundedRectangleBorder(
        //                                     borderRadius:
        //                                         BorderRadius.circular(20.0))),
        //                             child: const Text(
        //                               "Update Docket",
        //                               style: TextStyle(
        //                                   fontSize: 18,
        //                                   fontWeight: FontWeight.w500,
        //                                   color: Colors.white),
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           )
        //         : Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: const [
        //               Text(
        //                 "Please Enter Correct Docket Id",
        //                 style: TextStyle(
        //                     fontSize: 16,
        //                     color: Colors.black,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //             ],
        //           ),
        //   ),
        // ),
      ),
    );
  }
}
