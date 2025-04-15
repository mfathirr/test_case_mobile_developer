import 'package:equatable/equatable.dart';

class SubDistrictsSearchEntity extends Equatable {
  final String address;
  final String province;
  final String district;
  final String subDistrict;
  final String subDistrictCode;
  final int provinceId;
  final int districtId;
  final int subDistrictId;

  const SubDistrictsSearchEntity({
    required this.address,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.subDistrictCode,
    required this.provinceId,
    required this.districtId,
    required this.subDistrictId,
  });

  @override
  List<Object?> get props => [
        address,
        province,
        district,
        subDistrict,
        subDistrictCode,
        provinceId,
        districtId,
        subDistrictId,
      ];
}
