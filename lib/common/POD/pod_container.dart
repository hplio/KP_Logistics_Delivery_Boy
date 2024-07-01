import 'package:flutter/material.dart';
import 'package:la_logistics/common/POD/pod_column.dart';
import 'package:la_logistics/common/POD/pod_row.dart';

class PODDetailContainer extends StatelessWidget {
  const PODDetailContainer({
    super.key,
    required this.docketID,
    required this.noBox,
    required this.pDate,
    required this.dTime,
    required this.branch,
    required this.dbName,
    required this.rName,
    required this.rMobileNo,
    required this.id,
    required this.location,
  });

  final String docketID;
  final String noBox;
  final String pDate;
  final String dTime;
  final String branch;
  final String dbName;
  final String rName;
  final String rMobileNo;
  final String id;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF20147B),
            ),
            color: Color(0xFFefeff1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PODDetailRow(
                title: 'Docket Id',
                subTitle: docketID,
                // subTitle: podData.DocketId.toString(),
              ),
              SizedBox(
                height: 12,
              ),
              PODDetailRow(
                title: 'No. of Boxes',
                subTitle: noBox,
                // subTitle: podData.Packgs.toString(),
              ),
              SizedBox(
                height: 18,
              ),
              PODDetailColumn(
                title: "Pickup Date",
                subTitle: pDate,
                // subTitle: podData.ArrivalDate.toString(),
              ),
              SizedBox(
                height: 18,
              ),
              PODDetailColumn(
                title: 'Delivery Time',
                // subTitle: podData.DeliveryTime.toString(),
                subTitle: dTime,
              ),
              SizedBox(
                height: 18,
              ),
              PODDetailColumn(
                title: 'Branch',
                subTitle: branch,
                // subTitle: podData.Address.toString(),
              ),
              SizedBox(
                height: 18,
              ),
              PODDetailColumn(
                title: 'Delivery Boy Name',
                subTitle: dbName,
                // subTitle: podData.DeliveryBoyName.toString(),
              ),
              SizedBox(
                height: 18,
              ),
              PODDetailRow(
                title: 'Received By',
                subTitle: rName,
                // subTitle: podData.ReceivedBy.toString(),
              ),
              SizedBox(
                height: 18,
              ),
              PODDetailRow(
                title: 'Receiver Number',
                subTitle: rMobileNo,
                // subTitle: podData.ReceiverMobile.toString(),
              ),
              SizedBox(
                height: 18,
              ),
              PODDetailRow(
                title: 'Id Proof',
                subTitle: id,
                // subTitle: podData.Idproof.toString(),
              ),
              SizedBox(
                height: 18,
              ),
              PODDetailRow(
                title: 'Delivery Location',
                subTitle: location,
                // subTitle: podData.City.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
