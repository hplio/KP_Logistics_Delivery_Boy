import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../backend_files/update_docket_backend.dart';

class UpdatePickup extends StatefulWidget {
  static const routeName = "UpdatePickup";
  const UpdatePickup({super.key});

  @override
  State<UpdatePickup> createState() => _UpdatePickupState();
}

class _UpdatePickupState extends State<UpdatePickup> {
  TimeOfDay _startTime = TimeOfDay.now();
  DateTime _startDate = DateTime.now();
  int indecies = 0;
  List docketlist = ["PickUp", "Not Picked Up"];
  String? mainDocket;

  _dropDownWidget() {
    return DropdownButton<String>(
      isExpanded: true,
      value: mainDocket,
      icon: const Icon(
        Icons.keyboard_arrow_down_sharp,
        color: Color(0xFF9A3B81),
      ),
      elevation: 16,
      onChanged: (String? newVal) {
        setState(() {
          mainDocket = newVal!;
          indecies = docketlist.indexOf(mainDocket) + 1;
        });
      },
      underline: Container(),
      hint: Text(
        "Pickup Status",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      items: docketlist.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Future _selectDate(BuildContext contex) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2010, 1),
      lastDate: DateTime(2030, 7),
      helpText: "Select Date",
    );
    if (newDate != null) {
      setState(() {
        _startDate = newDate;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: _startTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != _startTime) {
      setState(() {
        _startTime = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
    print("iddd iz ${args["PickupDetails"]}");
    int docket = args["PickupDetails"]["Docket"][0]["DocketId"];
    UpdateDocketBackend _updateDocket =
        Provider.of<UpdateDocketBackend>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF3F3351),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    "Update Pickup Details",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10.0,
                            offset: const Offset(0, 10),
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Refrence No: ${args["PickupDetails"]["Reference"]}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "No. of Samples: ${args["PickupDetails"]["NoOfPcs"]}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Pickup Date: ${args["PickupDetails"]["Date"]}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Pickup Time: ${args["PickupDetails"]["PickupTime"]}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Packaging Required: Required",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  args["PackageDetails"].isNotEmpty
                                      ? "Shipment Temprature: ${args["PackageDetails"][0]["Temperature"]}"
                                      : "Shipment Temprature:",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Contact Person Name: ${args["PickupDetails"]["PickupRegistered"]}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Contact Person Number: ${args["PickupDetails"]["PickupRegisteredNumber"]}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Pickup received: ${args["PickupDetails"]["IsPickupRecived"]}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  args["PickupDetails"]["Docket"].isNotEmpty
                                      ? "Docket Id: ${args["PickupDetails"]["Docket"][0]["DocketId"]} "
                                      : "Docket Id: ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  args["PickupDetails"]["ConsigneeDetails"]
                                          .isNotEmpty
                                      ? "Pickup Address: ${args["PickupDetails"]["ConsigneeDetails"][0]["BillingAddress"]}"
                                      : "Pickup Address: ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  args["PickupDetails"]["ConsignerDetails"]
                                          .isNotEmpty
                                      ? "Delivery Location: ${args["PickupDetails"]["ConsignerDetails"][0]["BillingAddress"]}"
                                      : "Delivery Location: ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: queryData.size.height * 0.05),
                          Table(
                            border:
                                TableBorder.all(width: 2, color: Colors.grey),
                            children: [
                              const TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "No. of pcs",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Temprature Type",
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
                                  i < args['PackageDetails'].length;
                                  i++) ...[
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      " ${args['PickupDetails']['NoOfPcs']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      args['PackageDetails'][i]['TemperatureTypeId'] == 1
                                    ? "AMB"
                                    : args['PackageDetails'][i]['TemperatureTypeId'] == 2
                                    ? "REF"
                                    : args['PackageDetails'][i]['TemperatureTypeId'] == 3
                                    ? "FRZ"
                                    : "Other",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "${args['PackageDetails'][i]['Volume']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "${args['PickupDetails']['PackegeType']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      " ${args['PackageDetails'][i]['Temperature']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5.0),
                                  //   child: Text(
                                  //     " ${args['PackageDetails'][i]['REF']}",
                                  //     style: const TextStyle(
                                  //       color: Colors.black,
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(5.0),
                                  //   child: Text(
                                  //     " ${args['PackageDetails'][i]['FRZ']}",
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
                            border:
                                TableBorder.all(width: 2, color: Colors.grey),
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
                                    "Volumetrix",
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
                                  i < args['PackageDetails'].length;
                                  i++) ...[
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      " ${args['PackageDetails'][i]['Pkg']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      " ${args['PackageDetails'][i]['Volumetrix']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      " ${args['PickupDetails']['GrossWeight']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      " ${args['PickupDetails']['Remark']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ],
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.04,
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Docket Status",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              SizedBox(
                                width: queryData.size.width * 0.03,
                              ),
                              Container(
                                height: queryData.size.height * 0.08,
                                width: queryData.size.width * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white70,
                                    border: Border.all(
                                        width: 2, color: Color(0xFF89909F)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 3),
                                          blurRadius: 8.0,
                                          spreadRadius: 2.0),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: _dropDownWidget(),
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
                                "Date",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              SizedBox(
                                width: queryData.size.width * 0.03,
                              ),
                              IconButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              ),
                              const Expanded(child: SizedBox()),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10.0,
                                      offset: Offset(0, 10),
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "${_startDate.day}/${_startDate.month}/${_startDate.year}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
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
                                "Time",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              SizedBox(
                                width: queryData.size.width * 0.03,
                              ),
                              IconButton(
                                onPressed: () {
                                  _selectTime(context);
                                },
                                icon: const Icon(Icons.alarm_outlined),
                              ),
                              const Expanded(child: SizedBox()),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10.0,
                                      offset: Offset(0, 10),
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    _startTime.format(context),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.02,
                          ),
                          Center(
                            child: SizedBox(
                              width: queryData.size.width * 0.3,
                              height: queryData.size.height * 0.06,
                              child: ElevatedButton(
                                onPressed: () async {
                                  _lodingSection();
                                  var result = await _updateDocket.updatePickup(
                                      args["RequestedId"],
                                      mainDocket!,
                                      "${_startDate.day}/${_startDate.month}/${_startDate.year}",
                                      _startTime.format(context),
                                      args["PickupDetails"]["GrossWeight"],
                                      args["PickupDetails"]["NoOfPcs"]
                                          .toString());
                                  print("updating is $result");
                                  var man = await _updateDocket
                                      .createManifest(docket);
                                  print("manifest izzz $man");
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Pickup Updated")));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF864879),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                child: const Text(
                                  "Update",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _lodingSection() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          //dialogContext = context;
          return const Dialog(
            insetPadding: EdgeInsets.zero,
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: SpinKitCircle(
                  color: Color(0xFF864879),
                  size: 100,
                ),
              ),
            ),
          );
        });
  }
}
