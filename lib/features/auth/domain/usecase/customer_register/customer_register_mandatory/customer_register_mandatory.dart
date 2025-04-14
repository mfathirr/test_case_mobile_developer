import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/auth/domain/repository/auth_repository.dart';
import 'package:test_case_mobile_developer/features/auth/domain/usecase/customer_register/customer_register_mandatory/customer_register_mandatory_param.dart';

class CustomerRegisterMandatoryUseCase
    implements Usecase<Either<String, void>, CustomerRegisterMandatoryParam> {
  final AuthRepository _repository;

  CustomerRegisterMandatoryUseCase(this._repository);

  @override
  Future<Either<String, void>> call(
      CustomerRegisterMandatoryParam params) async {
    return await _repository.customerRegisterMandatory(
      userId: params.userId,
      firstName: params.firstName,
      lastName: params.lastName,
      password: params.password,
    );
  }
}
