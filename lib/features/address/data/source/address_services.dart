import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_case_mobile_developer/core/network/dio_client.dart';

class AddressServices {
  final DioClient dioClient;

  AddressServices(this.dioClient);

  Future<Response> customerListBlueray() async {
    return dioClient.get(
      '${dotenv.env['BASE_URL']}/customer/address',
    );
  }

  Future<Response> customerCreateBlueray({
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
    return dioClient.post(
      '${dotenv.env['BASE_URL']}/customer/address',
      data: {
        'address': address,
        'address_label': addressLabel,
        'name': name,
        'phone_number': phoneNumber,
        'email': email,
        'province_id': provinceId,
        'district_id': districtId,
        'sub_district_id': subDistrictId,
        'postal_code': postalCode,
        'lat': double.parse(lat),
        'long': double.parse(long),
        'address_map': addressMap,
        'npwp': npwp,
        'npwp_file': npwpFile,
      },
    );
  }

  Future<Response> customerDeleteBlueray({required int addressId}) async {
    return dioClient.delete(
      '${dotenv.env['BASE_URL']}/customer/address/delete',
      data: {
        "address_id": addressId,
      },
    );
  }

  Future<Response> customerUpdateBlueray({
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
    return dioClient.put(
      '${dotenv.env['BASE_URL']}/customer/address/$addressId',
      data: {
        'address': address,
        'address_label': addressLabel,
        'name': name,
        'phone_number': phoneNumber,
        'email': email,
        'province_id': provinceId,
        'district_id': districtId,
        'sub_district_id': subDistrictId,
        'postal_code': postalCode,
        'lat': lat,
        'long': long,
        'address_map': addressMap,
        'npwp': npwp,
        'npwp_file': npwpFile,
      },
    );
  }

  Future<Response> subDistrictSearch({required String search}) async {
    return dioClient.get(
      '${dotenv.env['BASE_URL']}/address/subdistricts/search?q=$search',
    );
  }

  Future<Response> getPrimaryAddress() async {
    return dioClient.get(
      '${dotenv.env['BASE_URL']}/customer/address/primary',
    );
  }

  Future<Response> postPrimaryAddress({required int addressId}) async {
    return dioClient
        .post('${dotenv.env['BASE_URL']}/customer/address/primary', data: {
      "address_id": addressId,
    });
  }

  Future<Response> postcodeValidation({required int postalCode}) async {
    return dioClient.get(
        '${dotenv.env['BASE_URL']}/address/postalcode/validation?postal_code=$postalCode');
  }

  Future<Response> getDetailSubdistrict({required int subdistrictId}) async {
    return dioClient
        .get('${dotenv.env['BASE_URL']}/address/subdistricts/$subdistrictId');
  }

  Future<Response> getDetailDistrict({required int districtId}) async {
    return dioClient
        .get('${dotenv.env['BASE_URL']}/address/district/$districtId');
  }
}
