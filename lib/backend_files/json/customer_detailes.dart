import 'package:json_annotation/json_annotation.dart';
part 'customer_detailes.g.dart';

@JsonSerializable()
class CustomerDFromJson {
  final int count;
  final bool success;
  final String message;
  final List<CustomerData> data;

  CustomerDFromJson(
      {required this.count,
      required this.success,
      required this.message,
      required this.data});

  factory CustomerDFromJson.fromJson(Map<String, dynamic> json) =>
      _$CustomerDFromJsonFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerDFromJsonToJson(this);
}

@JsonSerializable()
class CustomerData {
  final String id;
  final String CustomerId;
  final String CustomerName;
  final String Email;
  final int Mobile;
  final String BillingAddress;
  final String CompanyName;
  final String GstNo;
  final int StateId;
  final String Cityid;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
  final int v;

  CustomerData({
    required this.id,
    required this.CustomerId,
    required this.CustomerName,
    required this.Email,
    required this.Mobile,
    required this.BillingAddress,
    required this.CompanyName,
    required this.GstNo,
    required this.StateId,
    required this.Cityid,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CustomerData.formJson(Map<String,dynamic> json) => _$CustomerDataFromJson(json);
  Map<String,dynamic> toJson()=>_$CustomerDataToJson(this);
}
