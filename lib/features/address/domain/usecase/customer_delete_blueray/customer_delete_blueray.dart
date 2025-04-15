import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_delete_blueray/customer_delete_blueray_param.dart';

class CustomerDeleteBluerayUseCase
    implements Usecase<Either<String, void>, CustomerDeleteBluerayParam> {
  final AddressRepository _repository;

  CustomerDeleteBluerayUseCase(this._repository);

  @override
  Future<Either<String, void>> call(CustomerDeleteBluerayParam params) async {
    return await _repository.customerDeleteBlueray(
      addressId: params.addressId,
    );
  }
}
