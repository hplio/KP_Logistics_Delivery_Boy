import 'package:json_annotation/json_annotation.dart';

part 'city_id.g.dart';

@JsonSerializable()
class CityResponse {
  int count;
  bool success;
  List<City> data;

  CityResponse({
    required this.count,
    required this.success,
    required this.data,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) =>
      _$CityResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'Cityid')
  String? cityId;

  @JsonKey(name: 'City')
  String? cityName;

  @JsonKey(name: 'StateId')
  int? stateId;

  @JsonKey(name: 'State')
  String? stateName;

  City({
     this.id,
     this.cityId,
     this.cityName,
     this.stateId,
     this.stateName,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
