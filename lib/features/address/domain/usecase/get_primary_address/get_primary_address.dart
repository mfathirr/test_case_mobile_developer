import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/customer_list_address_blueray_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';

class GetPrimaryAddressUseCase
    implements Usecase<Either<String, CustomerAddressEntity>, void> {
  final AddressRepository _repository;

  GetPrimaryAddressUseCase(this._repository);

  @override
  Future<Either<String, CustomerAddressEntity>> call(void params) async {
    return await _repository.getPrimaryAddress();
  }
}
