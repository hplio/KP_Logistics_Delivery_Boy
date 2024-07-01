import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:la_logistics/backend_files/docket_delivery_details.dart';
import 'package:provider/provider.dart';

class UpdatingDocketScreen extends StatefulWidget {
  static const routeName = "UpdatingDocketScreen";
  const UpdatingDocketScreen({Key? key}) : super(key: key);

  @override
  State<UpdatingDocketScreen> createState() => _UpdatingDocketScreenState();
}

class _UpdatingDocketScreenState extends State<UpdatingDocketScreen> {
  // TextEditingController _recieverName = TextEditingController();
  // TextEditingController _recieverMobile = TextEditingController();
  // TimeOfDay _startTime = TimeOfDay.now();
  // DateTime _startDate = DateTime.now();
  //
  // Future _selectDate(BuildContext contex) async {
  //   final DateTime? newDate = await showDatePicker(
  //     context: context,
  //     initialDate: _startDate,
  //     firstDate: DateTime(2010, 1),
  //     lastDate: DateTime(2030, 7),
  //     helpText: "Select Date",
  //   );
  //   if (newDate != null) {
  //     setState(() {
  //       _startDate = newDate;
  //     });
  //   }
  // }
  //
  // _selectTime(BuildContext context) async {
  //   final TimeOfDay? timeOfDay = await showTimePicker(
  //     context: context,
  //     initialTime: _startTime,
  //     initialEntryMode: TimePickerEntryMode.dial,
  //   );
  //   if (timeOfDay != null && timeOfDay != _startTime) {
  //     setState(() {
  //       _startTime = timeOfDay;
  //     });
  //   }
  // }
  var list=[
    {'name':"No of Packing", "data":"33"},
    {'name':"Methods of\nPacking","data":"-"},
    {'name':"Volume (L*B*H)", "data":"55*12*18"},
    {'name':"Box Type", "data":"Round Box"},
    {'name':"AMB", "data":"Null"},
    {'name':"REF", "data":"Null"},
    {'name':"FRZ", "data":"Null"},
    {'name':"Packaging/\nPer Pack", "data":"15"},
    {'name':"Dry Ice", "data":"-"},
    {'name':"Actual Wt", "data":"435"},
    {'name':"Special\nInstructions", "data":"N/A"},
  ];
DateTime? _date;
  TimeOfDay? _time;

  @override
  Widget build(BuildContext context) {
    // var queryData = MediaQuery.of(context);
    // Map? args = ModalRoute.of(context)!.settings.arguments as Map;
    // DocketDeliveyDetails docketDeliveyDetails =
    //     Provider.of<DocketDeliveyDetails>(context);
    _dateString(){
      if(_date == null){
        return 'select date';
      }else{
        return'${_date?.day}/${_date?.month}/${_date?.year}';
      }
    }

    _timeString(){
      if(_time == null){
        return 'select time';
      }else{
        return'${_time?.hour}:${_time?.minute}';
      }
    }
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: 1400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back,size: 30,)
                        ),

                        Text("Docket Update",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF1C1678)
                          ),),
                        Container(
                            height: 35,
                            width: 35,
                            child: Image.asset('assets/jpg_img/Info1.jpg',)),
                      ],
                    ),
                  ),
                  Text('#21700',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF1C1678)
                    ),),
                  SizedBox(height: 15,),
                  Container(
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 1, color: Color(0xFF1C1678))),
                    child:Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset('assets/jpg_img/Delivery1.jpg')),
                              SizedBox(width: 8,),
                              Text('Ship to',style: TextStyle(
                                  fontSize: 17
                              ),),
                              SizedBox(width: 45,),
                              Text('Vishal Singh',style: TextStyle(
                                  fontSize: 17,fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset('assets/jpg_img/Home1.jpg')),
                              SizedBox(width: 8,),
                              Text('Address',style: TextStyle(
                                  fontSize: 17
                              ),),
                              SizedBox(width: 45,),
                              Text('Dange chowk,\nPune',style: TextStyle(
                                  fontSize: 17,fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset('assets/jpg_img/User.jpg')),
                              SizedBox(width: 8,),
                              Text('Mob No',style: TextStyle(
                                  fontSize: 17
                              ),),
                              SizedBox(width: 45,),
                              Text('7894563252',style: TextStyle(
                                  fontSize: 17,fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset('assets/jpg_img/ID Verified.jpg')),
                              SizedBox(width: 8,),
                              Text('Customer ID',style: TextStyle(
                                  fontSize: 17
                              ),),
                              SizedBox(width: 45,),
                              Text('60695',style: TextStyle(
                                  fontSize: 17,fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset('assets/jpg_img/Docket.jpg')),
                              SizedBox(width: 8,),
                              Text('Docket No',style: TextStyle(
                                  fontSize: 17
                              ),),
                              SizedBox(width: 45,),
                              Text('21700',style: TextStyle(
                                  fontSize: 17,fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset('assets/jpg_img/destination 1.jpg')),
                              SizedBox(width: 8,),
                              Text('Origin\nDestination',style: TextStyle(
                                  fontSize: 17
                              ),),
                              SizedBox(width: 45,),
                              Text('Nagpur\nAurangabad',style: TextStyle(
                                  fontSize: 17,fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 1, color: Color(0xFF1C1678))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ship By",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold
                        ),),
                        Text(" LA LOGISTICS",style: TextStyle(
                            fontSize: 20,color: Color(0xFF20147B),
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Table(
                    border:TableBorder.all(
                      width: 3,
                      color: Color(0xFF20147B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    columnWidths: {
                      0:FixedColumnWidth(130),
                      1:FixedColumnWidth(200)
                    },
                    children: [
                      for (var item in list)
                        TableRow(
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(item['name']!),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(item['data']!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF1C1678)
                                    ),),
                                ),
                              )
                            ]
                        )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Receiver Name",style: TextStyle(
                        fontSize: 15,
                      ),),
                      SizedBox(width: 15,),
                      Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Color(0xFF1C1678))),
                        child: Center(
                          child: Text("Enter Receiver Name",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                            ),),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter Phone No",style: TextStyle(
                        fontSize: 15,
                      ),),
                      SizedBox(width: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0xFF1C1678))),
                          child: Center(
                            child: Text("Enter Phone Number",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                              ),),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Date",style: TextStyle(
                        fontSize: 15,
                      ),),
                      SizedBox(width: 65,),
                      Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Color(0xFF1C1678))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Text(_dateString(),
                                style: TextStyle(
                                    fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),),
                              SizedBox(width: 25,),
                              GestureDetector(
                                onTap: ()async{
                                  final result = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2026),
                                  );
                                  if(result!=null){
                                    setState(() {
                                      _date = result;
                                    });
                                  }
                                },
                                  child: Icon(Icons.calendar_month_outlined,
                                    size: 30,))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Time",style: TextStyle(
                        fontSize: 15,
                      ),),
                      SizedBox(width: 65,),
                      Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Color(0xFF1C1678))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(_timeString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),),
                              SizedBox(width: 30,),
                              GestureDetector(
                                  onTap: ()async{
                                    final resultt = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      initialEntryMode: TimePickerEntryMode.dial
                                    );
                                    if(resultt!=null){
                                      setState(() {
                                        _time = resultt;
                                      });
                                    }
                                  },
                                  child: Icon(Icons.timer_outlined,
                                size: 30,))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Color(0xFF20147B),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Center(
                        child: Text("SAVE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),)),
                  ),
                ],
              ),
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
          //                     "Docket Delivery",
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
          //                             "${args["main"]['data'][0]['PickupDetails'][0]['PackegeType']}",
          //                             style: const TextStyle(
          //                               color: Colors.black,
          //                             ),
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.all(5.0),
          //                           child: Text(
          //                             " ${args["main"]['data'][0]['PackageDetails'][i]['Temperature']}",
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
          //                   height: queryData.size.height * 0.6,
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
          //                               "Receiver Name",
          //                               style: TextStyle(
          //                                   color: Colors.black, fontSize: 16),
          //                             ),
          //                             SizedBox(
          //                               width: queryData.size.width * 0.03,
          //                             ),
          //                             Expanded(
          //                               child: TextFormField(
          //                                 controller: _recieverName,
          //                                 decoration: const InputDecoration(
          //                                     labelText: "Enter Receiver Name",
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
          //                         Row(
          //                           children: [
          //                             const Text(
          //                               "Enter Mobile",
          //                               style: TextStyle(
          //                                   color: Colors.black, fontSize: 16),
          //                             ),
          //                             SizedBox(
          //                               width: queryData.size.width * 0.03,
          //                             ),
          //                             Expanded(
          //                               child: TextFormField(
          //                                 controller: _recieverMobile,
          //                                 keyboardType: TextInputType.number,
          //                                 decoration: const InputDecoration(
          //                                     labelText: "Enter Mobile Number",
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
          //                           height: queryData.size.height * 0.04,
          //                         ),
          //                         Row(
          //                           children: [
          //                             const Text(
          //                               "Date",
          //                               style: TextStyle(
          //                                   color: Colors.black, fontSize: 16),
          //                             ),
          //                             SizedBox(
          //                               width: queryData.size.width * 0.03,
          //                             ),
          //                             IconButton(
          //                               onPressed: () {
          //                                 _selectDate(context);
          //                               },
          //                               icon: const Icon(
          //                                   Icons.calendar_month_outlined),
          //                             ),
          //                             const Expanded(child: SizedBox()),
          //                             Container(
          //                               decoration: BoxDecoration(
          //                                 borderRadius:
          //                                     BorderRadius.circular(15.0),
          //                                 color: Colors.white,
          //                                 boxShadow: const [
          //                                   BoxShadow(
          //                                     color: Colors.grey,
          //                                     blurRadius: 10.0,
          //                                     offset: Offset(0, 10),
          //                                     spreadRadius: 1,
          //                                   ),
          //                                 ],
          //                               ),
          //                               child: Padding(
          //                                 padding: const EdgeInsets.all(15.0),
          //                                 child: Text(
          //                                   "${_startDate.day}/${_startDate.month}/${_startDate.year}",
          //                                   style: const TextStyle(
          //                                       color: Colors.black,
          //                                       fontSize: 20),
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           height: queryData.size.height * 0.04,
          //                         ),
          //                         Row(
          //                           children: [
          //                             const Text(
          //                               "Time",
          //                               style: TextStyle(
          //                                   color: Colors.black, fontSize: 16),
          //                             ),
          //                             SizedBox(
          //                               width: queryData.size.width * 0.03,
          //                             ),
          //                             IconButton(
          //                               onPressed: () {
          //                                 _selectTime(context);
          //                               },
          //                               icon: const Icon(Icons.alarm_outlined),
          //                             ),
          //                             const Expanded(child: SizedBox()),
          //                             Container(
          //                               decoration: BoxDecoration(
          //                                 borderRadius:
          //                                     BorderRadius.circular(15.0),
          //                                 color: Colors.white,
          //                                 boxShadow: const [
          //                                   BoxShadow(
          //                                     color: Colors.grey,
          //                                     blurRadius: 10.0,
          //                                     offset: Offset(0, 10),
          //                                     spreadRadius: 1,
          //                                   ),
          //                                 ],
          //                               ),
          //                               child: Padding(
          //                                 padding: const EdgeInsets.all(15.0),
          //                                 child: Text(
          //                                   _startTime.format(context),
          //                                   style: const TextStyle(
          //                                       color: Colors.black,
          //                                       fontSize: 20),
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           height: queryData.size.height * 0.05,
          //                         ),
          //                         SizedBox(
          //                           width: double.infinity,
          //                           height: queryData.size.height * 0.06,
          //                           child: ElevatedButton(
          //                             onPressed: (() async {
          //                               var result = await docketDeliveyDetails
          //                                   .updateDocketDeliveryDetails(
          //                                       args["main"]['data'][0]
          //                                               ['DocketId']
          //                                           .toInt(),
          //                                       _recieverName.text,
          //                                       int.parse(_recieverMobile.text),
          //                                       "${_startDate.day}/${_startDate.month}/${_startDate.year}",
          //                                       _startTime.format(context));
          //
          //                               if (result['success'] == true &&
          //                                   result['data'] != null) {
          //                                 ScaffoldMessenger.of(context)
          //                                     .showSnackBar(const SnackBar(
          //                                         content: Text(
          //                                             "Docket Delivery Details Added Successfully")));
          //                                 _recieverMobile.clear();
          //                                 _recieverName.clear();
          //                               } else {
          //                                 ScaffoldMessenger.of(context)
          //                                     .showSnackBar(const SnackBar(
          //                                         content: Text(
          //                                             "Please Enter COrrewct Details")));
          //                               }
          //                               print("hui hui ${result}");
          //                             }),
          //                             style: ElevatedButton.styleFrom(
          //                                 backgroundColor: const Color(0xFF864879),
          //                                 shape: RoundedRectangleBorder(
          //                                     borderRadius:
          //                                         BorderRadius.circular(20.0))),
          //                             child: const Text(
          //                               "Save",
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
      ),
    );
  }
}
