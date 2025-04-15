import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/get_detail_subdistrict/get_detail_subdistrict_param.dart';

class GetDetailSubdistrictUseCase
    implements Usecase<Either<String, void>, GetDetailSubdistrictParam> {
  final AddressRepository _repository;

  GetDetailSubdistrictUseCase(this._repository);

  @override
  Future<Either<String, void>> call(GetDetailSubdistrictParam params) async {
    return await _repository.getDetailSubdistrict(
      subdistrictId: params.subdistrictId,
    );
  }
}
