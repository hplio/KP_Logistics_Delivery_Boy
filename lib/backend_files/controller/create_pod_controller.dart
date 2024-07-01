import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:la_logistics/backend_files/controller/login_controller.dart';
import 'package:la_logistics/backend_files/json/customer_detailes.dart';
import 'package:la_logistics/backend_files/json_1/city_id.dart';
import 'package:la_logistics/backend_files/serializable_json/office_admin.dart';
import 'package:la_logistics/common/full_screen_loder.dart';
import 'package:la_logistics/common/get_snackbar.dart';
import 'package:la_logistics/screens/create_pod.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class CPodController extends GetxController {
  static CPodController get instance => Get.find();
  List<String>? customerNameList;
  List<String>? destinationList;
  List<String>? branchList;
  List? dataB;
  List? dataC;
  List? dataCity;
  var selectedBranch = 'Chhapra'.obs;
  final List<String> branches = [
    'Hyderabad',
    'Nashik',
    'Purna',
    'Pune',
  ];
  File? image;
  final getInDate = ''.obs;
  final bookInDate = ''.obs;
  final arrivalDate = ''.obs;
  final deliveryDate = ''.obs;
  final deliveryTime = ''.obs;
  final arrivalTime = ''.obs;
  final getInTime = ''.obs;
  final bookInTime = ''.obs;
  final branch = ''.obs;
  final branchId = ''.obs;
  final cName = ''.obs;
  final cId = ''.obs;
  final destination = ''.obs;
  final cityId = ''.obs;
  final originId = ''.obs;
  final origin = ''.obs;
  final consingnee = ''.obs;
  final consingneeId = ''.obs;
  final consingneer = ''.obs;
  final consingneerId = ''.obs;
  Rx<Prurpose> value = Prurpose.none.obs;
  final TextEditingController docNo = TextEditingController();
  final TextEditingController dBName = TextEditingController();
  final TextEditingController packages = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController drs = TextEditingController();
  final TextEditingController rName = TextEditingController();
  final TextEditingController mobileNo = TextEditingController();
  final TextEditingController idProof = TextEditingController();
  final TextEditingController remarks = TextEditingController();
  final GlobalKey<FormState> cPodKey = GlobalKey<FormState>();

  final controller = Get.put(LoginCon());
  final ImagePicker imagePicker = ImagePicker();

  Future<List<String>> fetchCustomerName() async {
    final response = await http
        .get(Uri.parse('http://3.111.47.3:13414/api/v1/customer/getCustomer'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      final jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];

      // Map the JSON data to a list of Branch objects.
      return data.map((json) => Customer.fromJson(json).customerName).toList();
    } else {
      // If the server does not return a 200 OK response, throw an error.
      throw Exception('Failed to load data');
    }
  }

  Future<List<String>> fetchCity() async {
    final response =
        await http.get(Uri.parse('http://3.111.47.3:13414/api/v1/getAllCity'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      final jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];

      // Map the JSON data to a list of Branch objects.
      return data.map((json) => City.fromJson(json).cityName).toList();
    } else {
      // If the server does not return a 200 OK response, throw an error.
      throw Exception('Failed to load data');
    }
  }

  Future<List<Map<String, String>>> fetchBranchIdAndAdminName() async {
    final url = 'http://3.111.47.3:13414/api/v1/officeAdmin/getOfficeAdmin';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final OfficeAdminResponse officeAdminResponse =
          OfficeAdminResponse.fromJson(jsonResponse);

      final List<Map<String, String>> result =
          officeAdminResponse.data.map((admin) {
        return {
          'BranchId': admin.BranchId,
          'AdminName': admin.AdminName,
        };
      }).toList();

      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Map<String, String>>> fetchCustomerIdCustomerAndName() async {
    final url = 'http://3.111.47.3:13414/api/v1/customer/getCustomer';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final CustomerDFromJson customerDFromJson =
          CustomerDFromJson.fromJson(jsonResponse);

      final List<Map<String, String>> result =
          customerDFromJson.data.map((admin) {
        return {
          'CustomerId': admin.CustomerId,
          'CustomerName': admin.CustomerName,
        };
      }).toList();
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Map<String, String?>>> fetchCityIdAndCityName() async {
    final url = 'http://3.111.47.3:13414/api/v1/getAllCity';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final CityResponse cityResponseFromJson =
          CityResponse.fromJson(jsonResponse);

      final List<Map<String, String?>> result =
          cityResponseFromJson.data.map((admin) {
        return {
          'Cityid': admin.cityId,
          'City': admin.cityName,
        };
      }).toList();
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<String>> fetchBranch() async {
    final response = await http.get(
        Uri.parse('http://3.111.47.3:13414/api/v1/officeAdmin/getOfficeAdmin'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      final jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];

      // Map the JSON data to a list of Branch objects.
      return data.map((json) => Branch.fromJson(json).branchName).toList();
      // return data.map((json) => City.fromJson(json).cityName).toList();
    } else {
      // If the server does not return a 200 OK response, throw an error.
      throw Exception('Failed to load data');
    }
  }

  Future<void> showPicker(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String formatTime(TimeOfDay selectedTime) {
    String formattedTime =
        '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  // Future<void> uploadImage() async {
  //   try {
  //     final url =
  //         Uri.parse('http://3.111.47.3:13414/api/v1/addImageInPod/PodImage');
  //     if (image == null) {
  //       return;
  //     }
  //     // final request = http.MultipartRequest('POST', url)
  //     //   ..files.add(await http.MultipartFile.fromPath('image', image!.path));
  //     Map<String, dynamic> body = {
  //       "PodImageId": "",
  //       "file": image,
  //       "PodId": "",
  //     };
  //     final http.Response response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode(body),
  //     );

  //     // final response = await request.send();
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       print('Image uploaded successfully');
  //       CustomSnackBar.normalSnackBar(
  //           'Sucsses', 'Image uploaded successfully', false);
  //     } else {
  //       print('Image upload failed');
  //       CustomSnackBar.errorSnackBar('Failed', 'Image upload failed', false);
  //     }
  //   } catch (e) {
  //     print('image error: $e');
  //     CustomSnackBar.errorSnackBar('Failed', e.toString(), false);
  //   }
  // }
  Future<void> uploadImage() async {
    try {
      final url =
          Uri.parse('http://3.111.47.3:13414/api/v1/addImageInPod/PodImage');
      // Create a multipart request
      final request = http.MultipartRequest('POST', url);

      // Add the image file to the request
      final mimeTypeData =
          lookupMimeType(image!.path)!.split('/'); // Get MIME type of the file
      final file = await http.MultipartFile.fromPath(
        'file',
        image!.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      );

      // Add additional fields if necessary
      request.fields['PodImageId'] = "";
      request.fields['PodId'] = "";
      request.files.add(file);

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      if (response.statusCode == 200) {
        CustomSnackBar.normalSnackBar(
            'Success', 'Image uploaded successfully', false);
      } else {
        CustomSnackBar.errorSnackBar('Failed', 'Image upload failed', false);
      }
    } catch (e) {
      CustomSnackBar.errorSnackBar('Failed', e.toString(), false);
    }
  }

  Future<void> loadData() async {
    KFullScreenLoder.openLodingDialog(
        'Please wait a moment...', 'assets/animation/animation.json');
    try {
      List<String> uniqueCustomerNameList = await fetchCustomerName();
      customerNameList = uniqueCustomerNameList;
      List<String> uniqueCityList = await fetchCity();
      destinationList = uniqueCityList;
      branchList = await fetchBranch();
      dataB = await fetchBranchIdAndAdminName();
      dataC = await fetchCustomerIdCustomerAndName();
      dataCity = await fetchCityIdAndCityName();
      KFullScreenLoder.stopLoading();
      Get.to(() => CreatePod());
    } catch (e) {
      KFullScreenLoder.stopLoading();
      if (kDebugMode) {
        print(e);
      }
      CustomSnackBar.errorSnackBar(
        'Failed',
        'Something want wrong..',
        false,
      );
    }
  }

  bool isSignature() {
    if (value == Prurpose.sign) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> createPod() async {
    KFullScreenLoder.openLodingDialog(
        'Please wait a moment...', 'assets/animation/animation.json');

    try {
      if (!cPodKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }

      if (getInDate.value.isEmpty ||
          getInTime.value.isEmpty ||
          bookInDate.value.isEmpty ||
          bookInTime.value.isEmpty ||
          arrivalDate.value.isEmpty ||
          arrivalTime.value.isEmpty ||
          deliveryDate.value.isEmpty ||
          deliveryTime.value.isEmpty) {
        KFullScreenLoder.stopLoading();
        CustomSnackBar.errorSnackBar(
            'Failed', 'Please enter all date and time', false);
        return;
      }
      Map<String, dynamic> body = {
        "PodId": "",
        "BranchId": branchId.value,
        "GateInDate": getInDate.value,
        "GateINTime": getInTime.value,
        "GRType": "",
        "GRId": docNo.text.trim(),
        "BookingDate": bookInDate.value,
        "BookingTime": bookInTime.value,
        "CustomerId": cId.value,
        "DestinationId": cityId.value,
        "OriginId": originId.value,
        "ConsigneeId": consingneeId.value,
        "ConsignerId": consingneerId.value,
        "ArrivalDate": arrivalDate.value,
        "ArrivalTime": arrivalTime.value,
        "Packgs": packages.text.trim(),
        "Weight": weight.text.trim(),
        "DeliveryBoyName": dBName.text.trim(),
        "DeliveryDate": deliveryDate.toString(),
        "DeliveryTime": deliveryTime.toString(),
        "DestinationReletaion": "",
        "DRSId": drs.text.trim(),
        "ReceivedBy": rName.text.trim(),
        "ReceiverMobile": mobileNo.text.trim(),
        "Idproof": idProof.text.trim(),
        "Remark": remarks.text.trim(),
        "WithSign": isSignature(),
        "Delivered": false,
        "DeliveryBoyId": controller.id.value,
      };
      if (image == null) {
        KFullScreenLoder.stopLoading();
        CustomSnackBar.errorSnackBar(
            'Failed', "Please upload your image", false);
        return;
      }
      await uploadImage();
      final http.Response response = await http.post(
        Uri.parse('http://3.111.47.3:13414/api/v1/createPodDetails'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        KFullScreenLoder.stopLoading();
        docNo.clear();
        branch.value = "";
        cName.value = "";
        destination.value = "";
        origin.value = "";
        consingnee.value = "";
        consingneer.value = "";
        dBName.clear();
        getInDate.value = "";
        getInTime.value = "";
        bookInDate.value = "";
        bookInTime.value = "";
        arrivalDate.value = "";
        arrivalTime.value = "";
        deliveryDate.value = "";
        deliveryTime.value = "";
        packages.clear();
        weight.clear();
        drs.clear();
        rName.clear();
        mobileNo.clear();
        idProof.clear();
        remarks.clear();
        value.value = Prurpose.none;
        KFullScreenLoder.stopLoading();
        Get.back();
        CustomSnackBar.normalSnackBar(
            'Succses', "Your Pod has been created", false);
      } else {
        KFullScreenLoder.stopLoading();
        CustomSnackBar.errorSnackBar('Failed', 'Something went wrong..', false);
        return;
      }
    } catch (e) {
      KFullScreenLoder.stopLoading();
      CustomSnackBar.errorSnackBar('Error', e.toString(), false);
      return;
    }
  }
}

class Customer {
  String customerName;

  Customer({required this.customerName});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerName: json['CustomerName'] ?? '',
    );
  }
}

class Branch {
  String branchName;

  Branch({required this.branchName});

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      branchName: json['AdminName'] ?? '',
    );
  }
}

class City {
  String cityName;

  City({required this.cityName});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityName: json['City'] ?? '',
    );
  }
}
