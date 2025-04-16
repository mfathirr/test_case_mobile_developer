import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_multiple%20copy/customer_create_multiple_param.dart';

class CustomerCreateMultipleUseCase
    implements
        Usecase<Either<String, void>, List<CustomerCreateMultipleParam>> {
  final AddressRepository _repository;

  CustomerCreateMultipleUseCase(this._repository);

  @override
  Future<Either<String, void>> call(
      List<CustomerCreateMultipleParam> params) async {
    return await _repository.customerCreateMultipleBlueray(
        addresses: params
            .map((param) => {
                  'address': param.address,
                  'name': param.name,
                  'phone_number': param.phoneNumber,
                  'province_id': param.provinceId,
                  'district_id': param.districtId,
                  'sub_district_id': param.subDistrictId,
                  'postal_code': param.postalCode,
                })
            .toList());
  }
}
