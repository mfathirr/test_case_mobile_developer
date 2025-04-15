import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_blueray/customer_create_blueray_param.dart';

class CustomerCreateBluerayUseCase
    implements Usecase<Either<String, void>, CustomerCreateBluerayParam> {
  final AddressRepository _repository;

  CustomerCreateBluerayUseCase(this._repository);

  @override
  Future<Either<String, void>> call(CustomerCreateBluerayParam params) async {
    return await _repository.customerCreateBlueray(
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
