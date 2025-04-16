import 'package:dartz/dartz.dart';
import 'package:test_case_mobile_developer/core/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/upload_image/upload_image_param.dart';

class UploadImageUseCase
    implements Usecase<Either<String, String>, UploadImageParam> {
  final AddressRepository _repository;

  UploadImageUseCase(this._repository);

  @override
  Future<Either<String, String>> call(UploadImageParam params) async {
    return await _repository.uploadImage(imageName: params.imageName);
  }
}
