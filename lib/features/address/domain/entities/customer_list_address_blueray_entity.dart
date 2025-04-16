import 'package:equatable/equatable.dart';

class CustomerAddressEntity extends Equatable {
  final int addressId;
  final int provinceId;
  final String provinceName;
  final int districtId;
  final String districtName;
  final int subDistrictId;
  final String subDistrictName;
  final String cityCode;
  final String npwpFile;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String name;
  final String address;
  final String postalCode;
  final String email;
  final String phoneNumber;
  final String? phoneNumber2;
  final String? npwp;
  final double? long;
  final double? lat;
  final String addressMap;
  final int customer;
  final int province;
  final int district;
  final int subDistrict;
  final String addressLabel;
  final bool isPrimary;

  const CustomerAddressEntity({
    required this.addressId,
    required this.provinceId,
    required this.provinceName,
    required this.districtId,
    required this.districtName,
    required this.subDistrictId,
    required this.subDistrictName,
    required this.cityCode,
    required this.npwpFile,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.address,
    required this.postalCode,
    required this.email,
    required this.phoneNumber,
    this.phoneNumber2,
    this.npwp,
    this.long,
    this.lat,
    required this.addressMap,
    required this.customer,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.addressLabel,
    required this.isPrimary,
  });

  @override
  List<Object?> get props => [
        addressId,
        provinceId,
        provinceName,
        districtId,
        districtName,
        subDistrictId,
        subDistrictName,
        cityCode,
        npwpFile,
        createdAt,
        updatedAt,
        deletedAt,
        name,
        address,
        postalCode,
        email,
        phoneNumber,
        phoneNumber2,
        npwp,
        long,
        lat,
        addressMap,
        customer,
        province,
        district,
        subDistrict,
        addressLabel,
        isPrimary
      ];
}
