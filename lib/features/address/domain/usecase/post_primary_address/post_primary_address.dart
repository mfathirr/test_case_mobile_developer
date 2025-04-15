import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/post_primary_address/post_primary_address_param.dart';

class PostPrimaryAddressUseCase
    implements Usecase<Either<String, void>, PostPrimaryAddressParam> {
  final AddressRepository _repository;

  PostPrimaryAddressUseCase(this._repository);

  @override
  Future<Either<String, void>> call(PostPrimaryAddressParam params) async {
    return await _repository.postPrimaryAddress(
      addressId: params.addressId,
    );
  }
}
