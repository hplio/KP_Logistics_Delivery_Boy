import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/controller/pod_detailes.dart';
import 'package:la_logistics/backend_files/json_2/pod_details_response.dart';
import 'package:la_logistics/common/POD/pod_container.dart';

class ViewPod extends StatefulWidget {
  @override
  _ViewPodState createState() => _ViewPodState();
}

class _ViewPodState extends State<ViewPod> {
  late Future<PodDetailsResponse> futurePodDetails;

  @override
  void initState() {
    super.initState();
    final controller = Get.put(PodDetailesController());
    futurePodDetails = controller.fetchPodDetails();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PodDetailesController());
    return Scaffold(
      appBar: AppBar(
        title: Text('View POD'),
      ),
      body: Center(
        child: FutureBuilder<PodDetailsResponse>(
          future: controller.fetchPodDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              var podData =
                  snapshot.data!; // Assuming you want the first POD data
              return ListView.separated(
                itemBuilder: (context, index) => PODDetailContainer(
                  docketID: podData.data[index].DocketId.toString(),
                  noBox: podData.data[index].Packgs.toString(),
                  pDate: podData.data[index].ArrivalDate.toString(),
                  dTime: podData.data[index].DeliveryTime.toString(),
                  branch: podData.data[index].Address.toString(),
                  dbName: podData.data[index].DeliveryBoyName.toString(),
                  rName: podData.data[index].ReceivedBy.toString(),
                  rMobileNo: podData.data[index].ReceiverMobile.toString(),
                  id: podData.data[index].Idproof.toString(),
                  location: podData.data[index].City.toString(),
                ),
                separatorBuilder: (_, __) => SizedBox(
                  height: 20,
                ),
                itemCount: snapshot.data!.data.length,
              );
            } else {
              return Text('No data found');
            }
          },
        ),
      ),
    );
  }
}
