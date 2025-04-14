import 'package:dartz/dartz.dart';

abstract interface class AuthRepository {
  Future<Either<String, void>> customerRegisterMini({
    required String userId,
  });
  Future<Either<String, void>> customerRegisterVerifyCode({
    required String userId,
    required String code,
  });
  Future<Either<String, void>> customerRegisterMandatory({
    required String userId,
    required String firstName,
    required String lastName,
    required String password,
  });
  Future<Either<String, void>> customerRegisterResendCode({
    required String userId,
  });
  Future<Either<String, void>> customerLogin({
    required String userId,
    required String password,
  });
  Future<Either<String, void>> customerLogout();
  Future<Either<String, void>> customerLogoutAll();
}
