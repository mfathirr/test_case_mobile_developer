import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_case_mobile_developer/features/auth/data/source/auth_local.dart';
import 'package:test_case_mobile_developer/features/auth/data/source/auth_services.dart';
import 'package:test_case_mobile_developer/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthServices _authServices;
  final AuthLocal _authLocal;

  AuthRepositoryImpl(this._authServices, this._authLocal);

  @override
  Future<Either<String, void>> customerLogin({
    required String userId,
    required String password,
  }) async {
    try {
      final response = await _authServices.customerLogin(
        userId: userId,
        password: password,
      );

      if (response.statusCode == 200) {
        await _authLocal.storeToken(response.data['token']);
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Login Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> customerLogout() async {
    try {
      final response = await _authServices.customerLogout();

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Logout Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> customerLogoutAll() async {
    try {
      final response = await _authServices.customerLogoutAll();

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Logout All Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> customerRegisterMandatory({
    required String userId,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    try {
      final response = await _authServices.customerRegisterMandatory(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        password: password,
      );

      if (response.statusCode == 200) {
        await _authLocal.storeToken(response.data['token']);
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Register Mandatory Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> customerRegisterMini({
    required String userId,
  }) async {
    try {
      final response = await _authServices.customerRegisterMini(
        userId: userId,
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Register Mini Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> customerRegisterResendCode({
    required String userId,
  }) async {
    try {
      final response = await _authServices.customerRegisterResendCode(
        userId: userId,
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Register Resend Code Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, void>> customerRegisterVerifyCode({
    required String userId,
    required String code,
  }) async {
    try {
      final response = await _authServices.customerRegisterVerifyCode(
        userId: userId,
        code: code,
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(
          response.data['message'] ?? 'Customer Register Verify Code Failed',
        );
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message']);
    } catch (e) {
      return Left("Unexpected error: ${e.toString()}");
    }
  }
}
