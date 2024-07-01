import 'package:json_annotation/json_annotation.dart';

part 'pod_details_response.g.dart';

@JsonSerializable()
class PodDetailsResponse {
  final int count;
  final bool success;
  final String message;
  final List<PodData> data;

  PodDetailsResponse({
    required this.count,
    required this.success,
    required this.message,
    required this.data,
  });

  factory PodDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PodDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PodDetailsResponseToJson(this);
}

@JsonSerializable()
class PodData {
  final int? DocketId;
  final int? Packgs;
  final String? ArrivalDate;
  final String? DeliveryTime;
  final String? Address;
  final String? DeliveryBoyName;
  final String? ReceivedBy;
  final int? ReceiverMobile;
  final String? Idproof;
  final String? City;

  PodData( {
     this.DocketId,
     this.Packgs,
     this.ArrivalDate,
     this.DeliveryTime,
     this.Address,
     this.DeliveryBoyName,
     this.ReceivedBy,
     this.ReceiverMobile,
     this.Idproof,
     this.City,
  });

  factory PodData.fromJson(Map<String, dynamic> json) =>
      _$PodDataFromJson(json);

  Map<String, dynamic> toJson() => _$PodDataToJson(this);
}
