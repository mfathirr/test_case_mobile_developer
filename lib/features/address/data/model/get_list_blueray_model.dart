import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/customer_list_address_blueray_entity.dart';

part 'get_list_blueray_model.freezed.dart';
part 'get_list_blueray_model.g.dart';

@freezed
class ConsumerAddressModel with _$ConsumerAddressModel {
  const factory ConsumerAddressModel({
    @JsonKey(name: "address_id") int? addressId,
    @JsonKey(name: "province_id") int? provinceId,
    @JsonKey(name: "province_name") String? provinceName,
    @JsonKey(name: "district_id") int? districtId,
    @JsonKey(name: "district_name") String? districtName,
    @JsonKey(name: "sub_district_id") int? subDistrictId,
    @JsonKey(name: "sub_district_name") String? subDistrictName,
    @JsonKey(name: "city_code") String? cityCode,
    @JsonKey(name: "npwp_file") String? npwpFile,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "deleted_at") dynamic deletedAt,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "postal_code") String? postalCode,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "phone_number_2") dynamic phoneNumber2,
    @JsonKey(name: "npwp") dynamic npwp,
    @JsonKey(name: "long") double? long,
    @JsonKey(name: "lat") double? lat,
    @JsonKey(name: "address_map") String? addressMap,
    @JsonKey(name: "customer") int? customer,
    @JsonKey(name: "province") int? province,
    @JsonKey(name: "district") int? district,
    @JsonKey(name: "sub_district") int? subDistrict,
    @JsonKey(name: "address_label") String? addressLabel,
    @JsonKey(name: "is_primary") bool? isPrimary,
  }) = _ConsumerAddressModel;

  factory ConsumerAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ConsumerAddressModelFromJson(json);
}

extension ConsumerAddressModelX on ConsumerAddressModel {
  CustomerAddressEntity toEntity() {
    return CustomerAddressEntity(
      addressId: addressId ?? 0,
      provinceId: provinceId ?? 0,
      provinceName: provinceName ?? "",
      districtId: districtId ?? 0,
      districtName: districtName ?? "",
      subDistrictId: subDistrictId ?? 0,
      subDistrictName: subDistrictName ?? "",
      cityCode: cityCode ?? "",
      npwpFile: npwpFile ?? "",
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      deletedAt: deletedAt ?? "",
      name: name ?? "",
      address: address ?? "",
      postalCode: postalCode ?? "",
      email: email ?? "",
      phoneNumber: phoneNumber ?? "",
      phoneNumber2: phoneNumber2 ?? "",
      npwp: npwp ?? "",
      long: long,
      lat: lat,
      addressMap: addressMap ?? "",
      customer: customer ?? 0,
      province: province ?? 0,
      district: district ?? 0,
      subDistrict: subDistrict ?? 0,
      addressLabel: addressLabel ?? "",
      isPrimary: isPrimary ?? false,
    );
  }
}
