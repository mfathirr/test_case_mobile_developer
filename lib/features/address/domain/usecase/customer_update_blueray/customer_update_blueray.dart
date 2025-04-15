import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_update_blueray/customer_update_blueray_param.dart';

class CustomerUpdateBluerayUseCase
    implements Usecase<Either<String, void>, CustomerUpdateBluerayParam> {
  final AddressRepository _repository;

  CustomerUpdateBluerayUseCase(this._repository);

  @override
  Future<Either<String, void>> call(CustomerUpdateBluerayParam params) async {
    return await _repository.customerUpdateBlueray(
      addressId: params.addressId,
      address: params.address,
      addressLabel: params.addressLabel,
      name: params.name,
      phoneNumber: params.phoneNumber,
      email: params.email,
      provinceId: params.provinceId,
      districtId: params.districtId,
      subDistrictId: params.subDistrictId,
      postalCode: params.postalCode,
      lat: params.lat,
      long: params.long,
      addressMap: params.addressMap,
      npwp: params.npwp,
      npwpFile: params.npwpFile,
    );
  }
}
