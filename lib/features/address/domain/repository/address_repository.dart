import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/customer_list_address_blueray_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/sub_district_search_entity.dart';

abstract interface class AddressRepository {
  Future<Either<String, List<CustomerAddressEntity>>> customerListBlueray();
  Future<Either<String, void>> customerCreateBlueray({
    required String address,
    required String addressLabel,
    required String name,
    required String phoneNumber,
    required String email,
    required int provinceId,
    required int districtId,
    required int subDistrictId,
    required String postalCode,
    required String lat,
    required String long,
    required String addressMap,
    required String? npwp,
    required String? npwpFile,
  });
  Future<Either<String, void>> customerDeleteBlueray({
    required int addressId,
  });
  Future<Either<String, void>> customerCreateMultipleBlueray({
    required List<Map<String, dynamic>> addresses,
  });
  Future<Either<String, void>> customerUpdateBlueray({
    required String addressId,
    required String address,
    required String addressLabel,
    required String name,
    required String phoneNumber,
    required String email,
    required int provinceId,
    required int districtId,
    required int subDistrictId,
    required String postalCode,
    required double lat,
    required double long,
    required String addressMap,
    required String? npwp,
    required String? npwpFile,
  });
  Future<Either<String, List<SubDistrictsSearchEntity>>> subDistrictSearch({
    required String search,
  });
  Future<Either<String, CustomerAddressEntity>> getPrimaryAddress();
  Future<Either<String, void>> postPrimaryAddress({
    required int addressId,
  });
  Future<Either<String, void>> postcodeValidation({
    required int postalCode,
  });
  Future<Either<String, void>> getDetailSubdistrict({
    required int subdistrictId,
  });
  Future<Either<String, void>> getDetailDistrict({
    required int districtId,
  });
  Future<Either<String, String>> uploadImage({required String imageName});
  Future<Either<String, String>> uploadFile({required String fileName});
}
