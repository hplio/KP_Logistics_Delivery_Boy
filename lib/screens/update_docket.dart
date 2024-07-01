import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/controller/docket_detail.dart';
import 'package:la_logistics/validators/validator.dart';

class UpdateDocket extends StatefulWidget {
  static const routeName = "UpdateDocket";
  const UpdateDocket({Key? key}) : super(key: key);

  @override
  State<UpdateDocket> createState() => _UpdateDocketState();
}

class _UpdateDocketState extends State<UpdateDocket> {
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    final controller = Get.put(DocketDetailsController());
    // GetDocketById getDocket = Provider.of<GetDocketById>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed(DocketUpdates.routeName);
            controller.getDocketDetailesById();
          },
          child: Container(
            height: 50,
            width: 370,
            decoration: BoxDecoration(
                color: Color(0xFF20147B),
                borderRadius: BorderRadius.circular(15)),
            child: const Center(
                child: Text(
              "CONTINUE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Container(
                        height: 140,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF20147B)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Text(
                                "Need Help ?",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "Raise   tickets   for  issues   on   your update.",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                          height: 75,
                          width: 70,
                          child: Image.asset(
                            'assets/jpg_img/Ticket1.jpg',
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                          height: 65,
                          width: 60,
                          child: Image.asset(
                            'assets/jpg_img/Estimate.jpg',
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: queryData.size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Can’t find your Update Docket?",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.001,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "To update your docket using your Docket Number",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.03,
                ),
                Form(
                  key: controller.docIdFormKey,
                  child: TextFormField(
                    controller: controller.docId,
                    validator: (value) =>
                        Kvalidator.validateEmptyText('Docket Number', value),
                    decoration: InputDecoration(
                        labelText: "",
                        filled: true,
                        fillColor: const Color(0xFFF0F0F0),
                        suffixIcon: Icon(Icons.search),
                        border: const OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
