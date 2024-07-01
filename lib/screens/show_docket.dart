import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/controller/login_controller.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ShowDocket extends StatelessWidget {
  static const routeName = "ShowDocket";
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginCon());
    return Scaffold(
      appBar: AppBar(
        title: Text('Docket Status'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              ()=> Text(
                '#${controller.id.value}',
                // '#21700',
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              ()=> Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTimelineTile('Date \n  &\nTime',
                      controller.dt.value, true, false),
                      // '2023-11-04\nT10:43:53.804Z', true, false),
                  buildTimelineTile('Docket ID', controller.id.value, false, false),
                  buildTimelineTile(
                      'Customer\nName', controller.name.value, false, false),
                  buildTimelineTile(
                      'Docket\nStatus', 'Docket\nCreated', false, false),
                  buildTimelineTile('Docket\nLocation', controller.address.value, false, true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TimelineTile buildTimelineTile(
      String title, String content, bool isFirst, bool isLast) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      lineXY: 0.3,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: Colors.green,
        padding: EdgeInsets.all(6),
        iconStyle: IconStyle(
          iconData: Icons.check,
          color: Colors.white,
        ),
      ),
      afterLineStyle: LineStyle(
        color: Colors.blue,
        thickness: 4,
      ),
      beforeLineStyle: LineStyle(
        color: Colors.blue,
        thickness: 4,
      ),
      startChild: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      endChild: Container(
        padding: EdgeInsets.only(left: 15, right: 8),
        child: Text(
          softWrap: true,
          content,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}


  // FutureBuilder(
                  //   future: getDocket.getDocketByBoy(providerState.deliveryBoyId),
                  //   builder: (context, snapshot) {
                      // if (snapshot.hasData) {
                      //   print((snapshot.data as Map)["data"][0]["Status"]);
                      // }
                      // return snapshot.hasData
                      //     ?
                      // ListView.builder(
                      //         itemCount: 1,
                      //         // (snapshot.data as Map)["data"].length,
                      //         //scrollDirection: Axis.vertical,
                      //        // physics: BouncingScrollPhysics(),
                      //         shrinkWrap: true,
                      //         itemBuilder: (context, index) {
                      //           return Column(
                      //             children: [
                      //               Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.white,
                      //                     boxShadow: [
                      //                       BoxShadow(
                      //                         color:
                      //                             Colors.grey.withOpacity(0.3),
                      //                         blurRadius: 4.0,
                      //                         offset: const Offset(0, 10),
                      //                         spreadRadius: 1,
                      //                       ),
                      //                     ],
                      //                     borderRadius:
                      //                         BorderRadius.circular(20.0),
                      //                     border: Border.all(
                      //                         width: 1, color: Colors.black)),
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.all(20.0),
                      //                   child: Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           Expanded(
                      //                             child: Text(
                      //                               "Docket Id:"
                      //                                   ,
                      //                                   // " ${(snapshot.data as Map)["data"][index]["Dockets"]["DocketId"]}",
                      //                               style: TextStyle(
                      //                                   fontSize: 16,
                      //                                   color: Colors.black),
                      //                             ),
                      //                           ),
                      //                           Expanded(
                      //                             child: Text(
                      //                               "Customer Name: ",
                      //                                   // "${(snapshot.data as Map)["data"][index]["Customer"][0]["CustomerName"]}",
                      //                               style: TextStyle(
                      //                                   fontSize: 16,
                      //                                   color: Colors.black),
                      //                             ),
                      //                           )
                      //                         ],
                      //                       ),
                      //                       SizedBox(
                      //                         height:
                      //                             queryData.size.height * 0.02,
                      //                       ),
                      //                       Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           Expanded(
                      //                             child: Text(
                      //                               // (snapshot.data as Map)["data"][index]["Status"].isNotEmpty
                      //                               // ? "Docket Status: ${(snapshot.data as Map)["data"][index]["Status"][0]["Status"]}"
                      //                               // :
                      //                               "Docket Status: ",
                      //                               style: TextStyle(
                      //                                   fontSize: 16,
                      //                                   color: Colors.black),
                      //                             ),
                      //                           ),
                      //                           Expanded(
                      //                             child: Text(
                      //                               // (snapshot.data as Map)["data"][index]["Status"].isNotEmpty
                      //                               // ? "Docket Location: ${(snapshot.data as Map)["data"][index]["Status"][((snapshot.data as Map)["data"][index]["Status"].length - 1)]["Currentlocation"] ?? ''}"
                      //                               // :
                      //                               "Docket Location: ",
                      //                               style: TextStyle(
                      //                                   fontSize: 16,
                      //                                   color: Colors.black),
                      //                             ),
                      //                           )
                      //                         ],
                      //                       ),
                      //                       SizedBox(
                      //                         height:
                      //                             queryData.size.height * 0.02,
                      //                       ),
                      //                       Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           Text(
                      //                             "Date & Time:",
                      //                                 // " ${(snapshot.data as Map)["data"][index]["Dockets"]["createdAt"]}",
                      //                             style: TextStyle(
                      //                                 fontSize: 16,
                      //                                 color: Colors.black),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: queryData.size.height * 0.03,
                      //               ),
                      //             ],
                      //           );
                      //         },
                      //       )
                  //         // : Center(child: CircularProgressIndicator());
                  //   },
                  // )