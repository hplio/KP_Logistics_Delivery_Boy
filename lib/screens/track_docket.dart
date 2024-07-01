import 'package:flutter/material.dart';
import 'package:la_logistics/screens/show_docket.dart';

class TrackDocket extends StatefulWidget {
  static const routeName = "TrackDocket";
  const TrackDocket({Key? key}) : super(key: key);

  @override
  State<TrackDocket> createState() => _TrackDocketState();
}

class _TrackDocketState extends State<TrackDocket> {
  TextEditingController _myController = TextEditingController();
  bool showWidget = true;
  var result;
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    // GetDocketById getDocket = Provider.of<GetDocketById>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar:         Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ShowDocket.routeName);

          },
          child: Container(
            height: 50,
            width: 370,
            decoration: BoxDecoration(
                color: Color(0xFF20147B),
                borderRadius: BorderRadius.circular(15)
            ),
            child: const Center(
                child: Text("CONTINUE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),)),
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
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,size: 40,)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50,left: 20),
                          child: Container(
                            height: 140,width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF20147B)
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20,),
                                  child: Text("Need Help ?",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 20),
                                  child: Text(
                                    "Raise   tickets   for issues on your track.",
                                    style: TextStyle(fontSize: 17,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                              height: 100,
                              width: 100,
                              child: Image.asset('assets/jpg_img/Ticket Purchase.jpg',)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: queryData.size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Can’t find your Track Docket?",
                        style: TextStyle(fontSize: 23,
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
                        "To track your docket using your Docket Number ",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),

                    SizedBox(
                      height: queryData.size.height * 0.03,
                    ),
                    TextFormField(
                      controller: _myController,
                      decoration: InputDecoration(
                          labelText: "Enter Your Docket Number",
                          filled: true,
                          fillColor: const Color(0xFFF0F0F0),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () async {
                             // Navigator.of(context).pushNamed(ShowDocket.routeName);
                              // result = await getDocket.getDetails(int.parse(_myController.text));
                              // print("hui hui ${result}}");
                              // if(result['data'].isEmpty){
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: Text("Please enter correct Docket Number"))
                              //   );
                              // }else{
                              //   setState(() {
                              //   showWidget = !showWidget;
                              // });
                              // }
                            },
                          ),
                          border: const OutlineInputBorder(
                              )),
                    ),

                    SizedBox(
                      height: queryData.size.height * 0.04,
                    ),
                    Visibility(
                      visible: !showWidget ? true : false,
                      child: Column(
                        children: [
                          const Text(
                            "Docket Status",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.03,
                          ),
                          result == null
                              ? const CircularProgressIndicator()
                              : Table(
                                  border: TableBorder.all(
                                      width: 2, color: Colors.grey),
                                  children: [
                                    const TableRow(children: [
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          "Docket Id",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          "Customer Name ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          "Docket Status",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          "Docket Location",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          "Date & Time",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    if(result['data'][0]["status"].isNotEmpty)...[
                                    for (int i = 0;
                                        i < result['data'][0]["status"].length;
                                        i++) ...[
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${result['data'][0]['DocketId']}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${result['data'][0]['Customer'][0]['CustomerName']}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${result['data'][0]['status'][i]['Status']}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${result['data'][0]['status'][i]['Currentlocation']}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${result['data'][0]['updatedAt']}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ]]
                                    else ...[
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${result['data'][0]['DocketId']}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${result['data'][0]['Customer'][0]['CustomerName']}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            " ",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            " ",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${result['data'][0]['updatedAt']}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ]),
                                  ],
                                    ]
                                ),
                        ],
                      ),
                    ),
        
                  ],
                ),
              ),
        
        ),
      ),
    );
  }
}
