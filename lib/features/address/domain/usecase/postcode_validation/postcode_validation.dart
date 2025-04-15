import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/postcode_validation/postcode_validation_param.dart';

class PostcodeValidationUseCase
    implements Usecase<Either<String, void>, PostcodeValidationParam> {
  final AddressRepository _repository;

  PostcodeValidationUseCase(this._repository);

  @override
  Future<Either<String, void>> call(PostcodeValidationParam params) async {
    return await _repository.postcodeValidation(
      postalCode: params.postalCode,
    );
  }
}
