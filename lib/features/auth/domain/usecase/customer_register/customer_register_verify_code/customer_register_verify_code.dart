import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/auth/domain/repository/auth_repository.dart';
import 'package:test_case_mobile_developer/features/auth/domain/usecase/customer_register/customer_register_verify_code/customer_register_verify_code_param.dart';

class CustomerRegisterVerifyCodeUseCase
    implements Usecase<Either<String, void>, CustomerRegisterVerifyCodeParam> {
  final AuthRepository _repository;

  CustomerRegisterVerifyCodeUseCase(this._repository);

  @override
  Future<Either<String, void>> call(
      CustomerRegisterVerifyCodeParam params) async {
    return await _repository.customerRegisterVerifyCode(
      userId: params.userId,
      code: params.code,
    );
  }
}
