// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicModel _$ClinicModelFromJson(Map<String, dynamic> json) => ClinicModel(
      clinicName: json['clinicName'] as String,
      specialty: json['specialty'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      district: json['district'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      phone: json['phone'] as String,
      listOfDays: (json['listOfDays'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      fromTimes:
          (json['fromTimes'] as List<dynamic>).map((e) => e as String).toList(),
      toTimes:
          (json['toTimes'] as List<dynamic>).map((e) => e as String).toList(),
      resetFromTimes: (json['resetFromTimes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      resetToTimes: (json['resetToTimes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ClinicModelToJson(ClinicModel instance) =>
    <String, dynamic>{
      'clinicName': instance.clinicName,
      'specialty': instance.specialty,
      'country': instance.country,
      'city': instance.city,
      'region': instance.region,
      'district': instance.district,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'phone': instance.phone,
      'listOfDays': instance.listOfDays,
      'fromTimes': instance.fromTimes,
      'toTimes': instance.toTimes,
      'resetFromTimes': instance.resetFromTimes,
      'resetToTimes': instance.resetToTimes,
    };
