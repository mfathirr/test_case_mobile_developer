import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_case_mobile_developer/features/address/data/model/get_list_blueray_model.dart';
import 'package:test_case_mobile_developer/features/address/data/model/get_primary_address_model.dart';
import 'package:test_case_mobile_developer/features/address/data/model/subdistrict_search_model.dart';
import 'package:test_case_mobile_developer/features/address/data/source/address_services.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/customer_list_address_blueray_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/get_primary_address_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/sub_district_search_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressServices _addressServices;

  AddressRepositoryImpl(this._addressServices);

  @override
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
  }) async {
    try {
      final response = await _addressServices.customerCreateBlueray(
        address: address,
        addressLabel: addressLabel,
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        provinceId: provinceId,
        districtId: districtId,
        subDistrictId: subDistrictId,
        postalCode: postalCode,
        lat: lat,
        long: long,
        addressMap: addressMap,
        npwp: npwp,
        npwpFile: npwpFile,
      );

      if (response.statusCode == 201) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Create Bluray Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> customerDeleteBlueray(
      {required int addressId}) async {
    try {
      final response = await _addressServices.customerDeleteBlueray(
        addressId: addressId,
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Create Bluray Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, List<CustomerAddressEntity>>>
      customerListBlueray() async {
    try {
      final response = await _addressServices.customerListBlueray();

      if (response.statusCode == 200) {
        return Right((response.data as List)
            .map((e) => ConsumerAddressModel.fromJson(e).toEntity())
            .toList());
      } else {
        return Left(
          response.data['message'] ?? 'Customer List Bluray Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
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
  }) async {
    try {
      final response = await _addressServices.customerUpdateBlueray(
        address: address,
        addressLabel: addressLabel,
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        provinceId: provinceId,
        districtId: districtId,
        subDistrictId: subDistrictId,
        postalCode: postalCode,
        lat: lat,
        long: long,
        addressMap: addressMap,
        npwp: npwp,
        npwpFile: npwpFile,
        addressId: addressId,
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Update Bluray Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> getDetailDistrict({
    required int districtId,
  }) async {
    try {
      final response = await _addressServices.getDetailDistrict(
        districtId: districtId,
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Get Detail District Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> getDetailSubdistrict({
    required int subdistrictId,
  }) async {
    try {
      final response = await _addressServices.getDetailSubdistrict(
        subdistrictId: subdistrictId,
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Get Detail Subdistrict Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, CustomerAddressEntity>> getPrimaryAddress() async {
    try {
      final response = await _addressServices.getPrimaryAddress();

      if (response.statusCode == 200) {
        return Right(
          ConsumerAddressModel.fromJson(response.data['result']).toEntity(),
        );
      } else {
        return Left(
          response.data['message'] ?? 'Get Primary Address Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> postPrimaryAddress({
    required int addressId,
  }) async {
    try {
      final response = await _addressServices.postPrimaryAddress(
        addressId: addressId,
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Post Primary Address Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> postcodeValidation(
      {required int postalCode}) async {
    try {
      final response = await _addressServices.postcodeValidation(
        postalCode: postalCode,
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Postcode Validation Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, List<SubDistrictsSearchEntity>>> subDistrictSearch({
    required String search,
  }) async {
    try {
      final response = await _addressServices.subDistrictSearch(
        search: search,
      );

      if (response.statusCode == 200) {
        return Right((response.data['data'] as List)
            .map((e) => SubdistrictSearchModel.fromJson(e).toEntity())
            .toList());
      } else {
        return Left(
          response.data['message'] ?? 'Sub District Search Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }
}
