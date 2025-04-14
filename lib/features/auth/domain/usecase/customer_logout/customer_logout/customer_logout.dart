import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/auth/domain/repository/auth_repository.dart';

class CustomerLogoutUseCase implements Usecase<Either<String, void>, void> {
  final AuthRepository _repository;

  CustomerLogoutUseCase(this._repository);

  @override
  Future<Either<String, void>> call(void params) async {
    return await _repository.customerLogout();
  }
}
