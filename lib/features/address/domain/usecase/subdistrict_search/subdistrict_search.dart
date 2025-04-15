import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/sub_district_search_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/subdistrict_search/subdistrict_search_param.dart';

class SubdistrictSearchUseCase
    implements Usecase<Either<String, List<SubDistrictsSearchEntity>>, SubdistrictSearchParam> {
  final AddressRepository _repository;

  SubdistrictSearchUseCase(this._repository);

  @override
  Future<Either<String, List<SubDistrictsSearchEntity>>> call(SubdistrictSearchParam params) async {
    return await _repository.subDistrictSearch(
      search: params.search,
    );
  }
}
