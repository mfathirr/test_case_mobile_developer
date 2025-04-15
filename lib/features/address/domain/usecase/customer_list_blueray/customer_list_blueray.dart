import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/customer_list_address_blueray_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';

class CustomerListBluerayUseCase
    implements Usecase<Either<String, List<CustomerAddressEntity>>, void> {
  final AddressRepository _repository;

  CustomerListBluerayUseCase(this._repository);

  @override
  Future<Either<String, List<CustomerAddressEntity>>> call(void params) async {
    return await _repository.customerListBlueray();
  }
}
