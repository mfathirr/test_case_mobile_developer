import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/get_detail_district/get_detail_district_param.dart';

class GetDetailDistrictUseCase
    implements Usecase<Either<String, void>, GetDetailDistrictParam> {
  final AddressRepository _repository;

  GetDetailDistrictUseCase(this._repository);

  @override
  Future<Either<String, void>> call(GetDetailDistrictParam params) async {
    return await _repository.getDetailDistrict(
      districtId: params.districtId,
    );
  }
}
