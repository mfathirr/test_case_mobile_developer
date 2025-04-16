import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/upload_file/upload_file_param.dart';

class UploadFileUseCase
    implements Usecase<Either<String, String>, UploadFileParam> {
  final AddressRepository _repository;

  UploadFileUseCase(this._repository);

  @override
  Future<Either<String, String>> call(UploadFileParam params) async {
    return await _repository.uploadFile(fileName: params.fileName);
  }
}
