import 'package:json_annotation/json_annotation.dart';

part 'clinic_model.g.dart';

@JsonSerializable()
class ClinicModel{
  @JsonKey(name:'clinicName')
   String clinicName;
  @JsonKey(name:'specialty')
   String specialty;
  @JsonKey(name:'country')
   String country;
  @JsonKey(name:'city')
   String city;
  @JsonKey(name:'region')
   String region;
  @JsonKey(name:'district')
   String district;
  @JsonKey(name:'latitude')
   String latitude;
  @JsonKey(name:'longitude')
   String longitude;
  @JsonKey(name:'phone')
  String phone;
  @JsonKey(name:'listOfDays')
  List<String> listOfDays;
  @JsonKey(name:'fromTimes')
   List<String> fromTimes;
  @JsonKey(name:'toTimes')
   List<String> toTimes;
  @JsonKey(name:'resetFromTimes')
   List<String> resetFromTimes;
  @JsonKey(name:'resetToTimes')
   List<String> resetToTimes;

  ClinicModel({
    required this.clinicName,
    required this.specialty,
    required this.country,
    required  this.city,
    required this.region,
    required this.district,
    required this.latitude,
    required this.longitude,
    required this.phone,
    required this.listOfDays,
    required this.fromTimes,
    required this.toTimes,
    required this.resetFromTimes,
    required  this.resetToTimes,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicModelToJson(this);
}
