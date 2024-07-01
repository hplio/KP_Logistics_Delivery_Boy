import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/controller/create_pod_controller.dart';
import 'package:la_logistics/common/cpod_textformfield_row.dart';
import 'package:la_logistics/common/drop_btn_row.dart';
import 'package:la_logistics/validators/validator.dart';

enum Prurpose { none, sign, stamp }

class CreatePod extends StatefulWidget {
  static const routeName = "CreatePod";
  const CreatePod({super.key});

  @override
  State<CreatePod> createState() => _CreatePodState();
}

class _CreatePodState extends State<CreatePod> {
  DateTime? _getDate;
  DateTime? _bookDate;
  DateTime? _aDate;
  DateTime? _dDate;
  TimeOfDay? _getTime;
  TimeOfDay? _bookTime;
  TimeOfDay? _aTime;
  TimeOfDay? _dTime;
  String? selectedBranch;
  String? selectedCustomer;
  String? selectedDestination;
  String? selectedOrigin;
  String? selectedConsignee;
  String? selectedConsigneer;
  Prurpose selectedItem = Prurpose.none;
  @override
  Widget build(BuildContext context) {
    _dateString() {
      if (_getDate == null) {
        return 'select date';
      } else {
        return '${_getDate?.day}/${_getDate?.month}/${_getDate?.year}';
      }
    }

    bookinDateString() {
      if (_bookDate == null) {
        return 'select date';
      } else {
        return '${_bookDate?.day}/${_bookDate?.month}/${_bookDate?.year}';
      }
    }

    aDateString() {
      if (_aDate == null) {
        return 'select date';
      } else {
        return '${_aDate?.day}/${_aDate?.month}/${_aDate?.year}';
      }
    }

    dDateString() {
      if (_dDate == null) {
        return 'select date';
      } else {
        return '${_dDate?.day}/${_dDate?.month}/${_dDate?.year}';
      }
    }

    final controller = Get.put(CPodController());

    _getTimeString() {
      if (_getTime == null) {
        return 'select time';
      } else {
        return '${_getTime?.hour}:${_getTime?.minute}';
      }
    }

    _bookTimeString() {
      if (_bookTime == null) {
        return 'select time';
      } else {
        return '${_bookTime?.hour}:${_bookTime?.minute}';
      }
    }

    _aTimeString() {
      if (_aTime == null) {
        return 'select time';
      } else {
        return '${_aTime?.hour}:${_aTime?.minute}';
      }
    }

    _dTimeString() {
      if (_dTime == null) {
        return 'select time';
      } else {
        return '${_dTime?.hour}:${_dTime?.minute}';
      }
    }

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
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        )),
                    Text(
                      "Create POD",
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
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: controller.cPodKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CPodTFRow(
                          controller: controller.docNo,
                          title: "Enter Docket No",
                          validator: (value) =>
                              Kvalidator.validateEmptyText('Docket NO', value),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CPodDropBtnRow(
                          maxHight: 53,
                          title: 'Branch',
                          branches: controller.branchList ?? ['Empty'],
                          selectedBranch: selectedBranch,
                          hintText: 'Select Branch',
                          betweenSpace: MediaQuery.of(context).size.width * .3,
                          onChanged: (value) {
                            setState(() {
                              selectedBranch = value;
                              controller.branchId.value = controller.dataB!
                                  .firstWhere((item) =>
                                      item['AdminName'] ==
                                      selectedBranch)['BranchId'];
                              // print('branch: ${controller.branchId.value}');
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CPodDropBtnRow(
                          maxHight: 53,
                          betweenSpace: MediaQuery.of(context).size.width * .14,
                          branches: controller.customerNameList ?? ['Empty'],
                          selectedBranch: selectedCustomer,
                          title: 'Customer Name',
                          hintText: 'Customer',
                          onChanged: (Value) {
                            setState(() {
                              selectedCustomer = Value;
                              // print(controller.dataC);
                              controller.cId.value = controller.dataC!
                                  .firstWhere((item) =>
                                      item['CustomerName'] ==
                                      selectedCustomer)['CustomerId'];
                              // print(controller.cId.value);
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CPodDropBtnRow(
                          maxHight: 53,
                          betweenSpace: MediaQuery.of(context).size.width * .14,
                          branches: controller.destinationList ?? ['Empty'],
                          selectedBranch: selectedDestination,
                          title: 'Destination',
                          hintText: 'Select Destination',
                          onChanged: (value) {
                            setState(() {
                              selectedDestination = value;
                              controller.cityId.value = controller.dataCity!
                                  .firstWhere((item) =>
                                      item['City'] ==
                                      selectedDestination)['Cityid'];
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CPodDropBtnRow(
                          maxHight: 50,
                          branches: controller.destinationList ?? ['Empty'],
                          selectedBranch: selectedOrigin,
                          title: 'Origin',
                          hintText: 'Select Origin',
                          onChanged: (value) {
                            setState(() {
                              selectedOrigin = value;
                              controller.originId.value = controller.dataCity!
                                  .firstWhere((item) =>
                                      item['City'] == selectedOrigin)['Cityid'];
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CPodDropBtnRow(
                          maxHight: 53,
                          betweenSpace: MediaQuery.of(context).size.width * .16,
                          branches: controller.customerNameList ?? ['Empty'],
                          selectedBranch: selectedConsignee,
                          title: 'Consignee',
                          hintText: 'Select Consignee',
                          onChanged: (Value) {
                            setState(() {
                              selectedConsignee = Value;
                              controller.consingneeId.value = controller.dataC!
                                  .firstWhere((item) =>
                                      item['CustomerName'] ==
                                      selectedConsignee)['CustomerId'];
                              // print(controller.consingneeId.value);
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CPodDropBtnRow(
                          maxHight: 53,
                          betweenSpace: MediaQuery.of(context).size.width * .12,
                          branches: controller.customerNameList ?? ['Empty'],
                          selectedBranch: selectedConsigneer,
                          title: 'Consigneer',
                          hintText: 'Select Consigneer',
                          onChanged: (Value) {
                            setState(() {
                              selectedConsigneer = Value;
                              controller.consingneerId.value = controller.dataC!
                                  .firstWhere((item) =>
                                      item['CustomerName'] ==
                                      selectedConsigneer)['CustomerId'];
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CPodTFRow(
                          controller: controller.dBName,
                          title: 'Delivery Boy\nName',
                          validator: (p0) => Kvalidator.validateEmptyText(
                            'Delivery Boy Name',
                            p0,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gate In Date",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 7),
                                GestureDetector(
                                  onTap: () async {
                                    final result = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2026),
                                    );
                                    if (result != null) {
                                      setState(() {
                                        _getDate = result;
                                        String v = result.toString();
                                        controller.getInDate.value = v;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFF1C1678))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          _dateString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gate In Time",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final resultt = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                    if (resultt != null) {
                                      setState(() {
                                        _getTime = resultt;
                                        controller.getInTime.value =
                                            controller.formatTime(resultt);
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFF1C1678))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          _getTimeString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.timer_outlined,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Booking Date ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 7),
                                GestureDetector(
                                  onTap: () async {
                                    final result = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2026),
                                    );
                                    if (result != null) {
                                      setState(() {
                                        _bookDate = result;
                                        controller.bookInDate.value =
                                            result.toString();
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFF1C1678))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          bookinDateString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Booking Time ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final resultt = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                    if (resultt != null) {
                                      setState(() {
                                        _bookTime = resultt;
                                        controller.bookInTime.value =
                                            controller.formatTime(resultt);
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFF1C1678))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          _bookTimeString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.timer_outlined,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Arrival Date ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 7),
                                GestureDetector(
                                  onTap: () async {
                                    final result = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2026),
                                    );
                                    if (result != null) {
                                      setState(() {
                                        _aDate = result;
                                        controller.arrivalDate.value =
                                            result.toString();
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFF1C1678))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          aDateString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Arrival Time ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final resultt = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                    if (resultt != null) {
                                      setState(() {
                                        _aTime = resultt;
                                        controller.arrivalTime.value =
                                            controller.formatTime(resultt);
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFF1C1678))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          _aTimeString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.timer_outlined,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery Date  ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 7),
                                GestureDetector(
                                  onTap: () async {
                                    final result = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2026),
                                    );
                                    if (result != null) {
                                      setState(() {
                                        _dDate = result;
                                        controller.deliveryDate.value =
                                            result.toString();
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFF1C1678))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          dDateString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery Time",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final resultt = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        initialEntryMode:
                                            TimePickerEntryMode.dial);
                                    if (resultt != null) {
                                      setState(() {
                                        _dTime = resultt;
                                        controller.deliveryTime.value =
                                            controller.formatTime(resultt);
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xFF1C1678),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          _dTimeString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.timer_outlined,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CPodTFRow(
                          controller: controller.packages,
                          title: 'Packages',
                          validator: (p0) => Kvalidator.validateEmptyText(
                            'Packages',
                            p0,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CPodTFRow(
                          controller: controller.weight,
                          title: 'Weight',
                          validator: (value) =>
                              Kvalidator.validateEmptyText('Weight', value),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CPodTFRow(
                          controller: controller.drs,
                          title: 'DRS',
                          validator: (p0) =>
                              Kvalidator.validateEmptyText('DRS', p0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CPodTFRow(
                          controller: controller.rName,
                          title: 'Received By',
                          hintText: 'Received by(Name)',
                          validator: (value) => Kvalidator.validateEmptyText(
                            'Received by(Name)',
                            value,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CPodTFRow(
                          controller: controller.mobileNo,
                          hintText: '+91 -',
                          title: "Mobile No",
                          validator: (p0) =>
                              Kvalidator.validateEmptyText('"Mobile No"', p0),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CPodTFRow(
                          controller: controller.idProof,
                          title: 'ID Proof',
                          validator: (p0) =>
                              Kvalidator.validateEmptyText('ID Proof', p0),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          validator: (value) =>
                              Kvalidator.validateEmptyText('Remarks', value),
                          controller: controller.remarks,
                          decoration: InputDecoration(
                            hintText: 'Remarks',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFF1C1678),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Select Signature or Stamp",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: RadioListTile<Prurpose>(
                                fillColor: WidgetStateProperty.all(
                                  Color(0xFF1C1678),
                                ),
                                title: Text('Signature'),
                                value: Prurpose.sign,
                                groupValue: selectedItem,
                                onChanged: (Prurpose? value) {
                                  setState(() {
                                    selectedItem = value!;
                                    controller.value.value = value;
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Prurpose>(
                                fillColor: WidgetStateProperty.all(
                                  Color(0xFF1C1678),
                                ),
                                title: Text('Stamp'),
                                value: Prurpose.stamp,
                                groupValue: selectedItem,
                                onChanged: (Prurpose? value) {
                                  setState(() {
                                    selectedItem = value!;
                                    controller.value.value = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () => controller.showPicker(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1C1678),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Upload Proof Image',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => controller.createPod(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1C1678),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
