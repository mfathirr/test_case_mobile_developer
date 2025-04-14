import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/auth/domain/repository/auth_repository.dart';
import 'package:test_case_mobile_developer/features/auth/domain/usecase/customer_register/customer_register_mini/customer_register_mini_param.dart';

class CustomerRegisterMiniUseCase
    implements Usecase<Either<String, void>, CustomerRegisterMiniParam> {
  final AuthRepository _repository;

  CustomerRegisterMiniUseCase(this._repository);

  @override
  Future<Either<String, void>> call(CustomerRegisterMiniParam params) async {
    return await _repository.customerRegisterMini(userId: params.userId);
  }
}
