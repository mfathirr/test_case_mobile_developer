import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_case_mobile_developer/core/network/dio_client.dart';

class AuthServices {
  final DioClient dioClient;

  AuthServices(this.dioClient);

  Future<Response> customerRegisterMini({
    required String userId,
  }) async {
    return dioClient.post(
      '${dotenv.env['BASE_URL']}/customer/register/mini',
      data: {
        'user_id': userId,
      },
    );
  }

  Future<Response> customerRegisterVerifyCode({
    required String userId,
    required String code,
  }) async {
    return dioClient.post(
      '${dotenv.env['BASE_URL']}/customer/register/verify-code',
      data: {
        'user_id': userId,
        code: code,
      },
    );
  }

  Future<Response> customerRegisterMandatory({
    required String userId,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    return dioClient.post(
      '${dotenv.env['BASE_URL']}/customer/register/mandatory',
      data: {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
      },
    );
  }

  Future<Response> customerRegisterResendCode({
    required String userId,
  }) async {
    return dioClient.post(
      '${dotenv.env['BASE_URL']}/customer/register/resend-code',
      data: {
        "user_id": userId,
      },
    );
  }

  Future<Response> customerLogin({
    required String userId,
    required String password,
  }) async {
    return dioClient.post(
      '${dotenv.env['BASE_URL']}/customer/login',
      data: {
        "user_id": userId,
        "password": password,
      },
    );
  }

  Future<Response> customerLogout() async {
    return dioClient.post(
      '${dotenv.env['BASE_URL']}/customer/logout',
    );
  }

  Future<Response> customerLogoutAll() async {
    return dioClient.post(
      '${dotenv.env['BASE_URL']}/customer/logout-all',
    );
  }
}
