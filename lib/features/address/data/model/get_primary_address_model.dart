import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/get_primary_address_entity.dart';

part 'get_primary_address_model.freezed.dart';
part 'get_primary_address_model.g.dart';

@freezed
class GetPrimaryAddressModel with _$GetPrimaryAddressModel {
  const factory GetPrimaryAddressModel({
    @JsonKey(name: 'address_id') required int addressId,
    @JsonKey(name: 'province_id') required int provinceId,
    @JsonKey(name: 'province_name') required String provinceName,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'district_name') required String districtName,
    @JsonKey(name: 'sub_district_id') required int subDistrictId,
    @JsonKey(name: 'sub_district_name') required String subDistrictName,
    @JsonKey(name: 'city_code') required String cityCode,
    @JsonKey(name: 'npwp_file') required String npwpFile,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    required String name,
    required String address,
    @JsonKey(name: 'postal_code') required String postalCode,
    String? email,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'phone_number_2') String? phoneNumber2,
    String? npwp,
    double? long,
    double? lat,
    @JsonKey(name: 'address_map') required String addressMap,
    @JsonKey(name: 'is_primary') required bool isPrimary,
    required int customer,
    required int province,
    required int district,
    @JsonKey(name: 'sub_district') required int subDistrict,
  }) = _GetPrimaryAddressModel;

  factory GetPrimaryAddressModel.fromJson(Map<String, dynamic> json) =>
      _$GetPrimaryAddressModelFromJson(json);
}

extension GetPrimaryAddressModelX on GetPrimaryAddressModel {
  GetPrimaryAddressEntity toEntity() {
    return GetPrimaryAddressEntity(
      addressId: addressId,
      provinceId: provinceId,
      provinceName: provinceName,
      districtId: districtId,
      districtName: districtName,
      subDistrictId: subDistrictId,
      subDistrictName: subDistrictName,
      cityCode: cityCode,
      npwpFile: npwpFile,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt ?? "",
      name: name,
      address: address,
      postalCode: postalCode,
      email: email ?? "",
      phoneNumber: phoneNumber,
      phoneNumber2: phoneNumber2 ?? "",
      npwp: npwp ?? "",
      long: long ?? 0.0,
      lat: lat ?? 0.0,
      addressMap: addressMap,
      isPrimary: isPrimary,
      customer: customer,
      province: province,
      district: district,
      subDistrict: subDistrict,
    );
  }
}
