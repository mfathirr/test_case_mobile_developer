import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/auth/domain/repository/auth_repository.dart';
import 'package:test_case_mobile_developer/features/auth/domain/usecase/customer_register/customer_register_resend_code/customer_register_resend_code_param.dart';

class CustomerRegisterResendCodeUseCase
    implements Usecase<Either<String, void>, CustomerRegisterResendCodeParam> {
  final AuthRepository _repository;

  CustomerRegisterResendCodeUseCase(this._repository);

  @override
  Future<Either<String, void>> call(
      CustomerRegisterResendCodeParam params) async {
    return await _repository.customerRegisterResendCode(
      userId: params.userId,
    );
  }
}
