import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/sub_district_search_entity.dart';

part 'subdistrict_search_model.freezed.dart';
part 'subdistrict_search_model.g.dart';

@freezed
class SubdistrictSearchModel with _$SubdistrictSearchModel {
  factory SubdistrictSearchModel({
    required String address,
    required String province,
    required String district,
    @JsonKey(name: 'sub_district') required String subDistrict,
    @JsonKey(name: 'sub_district_code') required String subDistrictCode,
    @JsonKey(name: 'province_id') required int provinceId,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'sub_district_id') required int subDistrictId,
  }) = _SubdistrictSearchModel;

  factory SubdistrictSearchModel.fromJson(Map<String, dynamic> json) =>
      _$SubdistrictSearchModelFromJson(json);
}

extension SubdistrictSearchModelX on SubdistrictSearchModel {
  SubDistrictsSearchEntity toEntity() {
    return SubDistrictsSearchEntity(
      address: address,
      province: province,
      district: district,
      subDistrict: subDistrict,
      subDistrictCode: subDistrictCode,
      provinceId: provinceId,
      districtId: districtId,
      subDistrictId: subDistrictId,
    );
  }
}
