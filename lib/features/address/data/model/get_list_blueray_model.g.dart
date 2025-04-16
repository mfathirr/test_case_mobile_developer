// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_blueray_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsumerAddressModelImpl _$$ConsumerAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConsumerAddressModelImpl(
      addressId: (json['address_id'] as num?)?.toInt(),
      provinceId: (json['province_id'] as num?)?.toInt(),
      provinceName: json['province_name'] as String?,
      districtId: (json['district_id'] as num?)?.toInt(),
      districtName: json['district_name'] as String?,
      subDistrictId: (json['sub_district_id'] as num?)?.toInt(),
      subDistrictName: json['sub_district_name'] as String?,
      cityCode: json['city_code'] as String?,
      npwpFile: json['npwp_file'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
      name: json['name'] as String?,
      address: json['address'] as String?,
      postalCode: json['postal_code'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      phoneNumber2: json['phone_number_2'],
      npwp: json['npwp'],
      long: (json['long'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      addressMap: json['address_map'] as String?,
      customer: (json['customer'] as num?)?.toInt(),
      province: (json['province'] as num?)?.toInt(),
      district: (json['district'] as num?)?.toInt(),
      subDistrict: (json['sub_district'] as num?)?.toInt(),
      addressLabel: json['address_label'] as String?,
      isPrimary: json['is_primary'] as bool?,
    );

Map<String, dynamic> _$$ConsumerAddressModelImplToJson(
        _$ConsumerAddressModelImpl instance) =>
    <String, dynamic>{
      'address_id': instance.addressId,
      'province_id': instance.provinceId,
      'province_name': instance.provinceName,
      'district_id': instance.districtId,
      'district_name': instance.districtName,
      'sub_district_id': instance.subDistrictId,
      'sub_district_name': instance.subDistrictName,
      'city_code': instance.cityCode,
      'npwp_file': instance.npwpFile,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'name': instance.name,
      'address': instance.address,
      'postal_code': instance.postalCode,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'phone_number_2': instance.phoneNumber2,
      'npwp': instance.npwp,
      'long': instance.long,
      'lat': instance.lat,
      'address_map': instance.addressMap,
      'customer': instance.customer,
      'province': instance.province,
      'district': instance.district,
      'sub_district': instance.subDistrict,
      'address_label': instance.addressLabel,
      'is_primary': instance.isPrimary,
    };
