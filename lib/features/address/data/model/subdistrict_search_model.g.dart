// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subdistrict_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubdistrictSearchModelImpl _$$SubdistrictSearchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubdistrictSearchModelImpl(
      address: json['address'] as String,
      province: json['province'] as String,
      district: json['district'] as String,
      subDistrict: json['sub_district'] as String,
      subDistrictCode: json['sub_district_code'] as String,
      provinceId: (json['province_id'] as num).toInt(),
      districtId: (json['district_id'] as num).toInt(),
      subDistrictId: (json['sub_district_id'] as num).toInt(),
    );

Map<String, dynamic> _$$SubdistrictSearchModelImplToJson(
        _$SubdistrictSearchModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'province': instance.province,
      'district': instance.district,
      'sub_district': instance.subDistrict,
      'sub_district_code': instance.subDistrictCode,
      'province_id': instance.provinceId,
      'district_id': instance.districtId,
      'sub_district_id': instance.subDistrictId,
    };
