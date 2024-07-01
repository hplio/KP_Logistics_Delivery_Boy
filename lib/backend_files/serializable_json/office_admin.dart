import 'package:json_annotation/json_annotation.dart';

part 'office_admin.g.dart';

@JsonSerializable()
class OfficeAdminResponse {
  final int count;
  final bool success;
  final String message;
  final List<OfficeAdminData> data;

  OfficeAdminResponse(
      {required this.count,
      required this.success,
      required this.message,
      required this.data});

  factory OfficeAdminResponse.fromJson(Map<String, dynamic> json) =>
      _$OfficeAdminResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeAdminResponseToJson(this);
}

@JsonSerializable()
class OfficeAdminData {
  final String id;
  final String BranchId;
  final String AdminName;
  final String Email;
  final int Mobile;
  final String Password;
  final String Address;
  final int GroupId;
  final String Cityid;
  final int StateId;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
  final int v;

  OfficeAdminData({
    required this.id,
    required this.BranchId,
    required this.AdminName,
    required this.Email,
    required this.Mobile,
    required this.Password,
    required this.Address,
    required this.GroupId,
    required this.Cityid,
    required this.StateId,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory OfficeAdminData.fromJson(Map<String, dynamic> json) =>
      _$OfficeAdminDataFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeAdminDataToJson(this);
}
