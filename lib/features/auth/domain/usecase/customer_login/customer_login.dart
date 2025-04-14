import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/auth/domain/repository/auth_repository.dart';
import 'package:test_case_mobile_developer/features/auth/domain/usecase/customer_login/customer_login_param.dart';

class CustomerLoginUseCase implements Usecase<Either<String, void>, CustomerLoginParam> {
  final AuthRepository _repository;

  CustomerLoginUseCase(this._repository);

  @override
  Future<Either<String, void>> call(CustomerLoginParam params) async {
    return await _repository.customerLogin(
      userId: params.userId,
      password: params.password,
    );
  }
}
