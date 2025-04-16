import 'package:bloc/bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/customer_list_address_blueray_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/sub_district_search_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_blueray/customer_create_blueray.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_blueray/customer_create_blueray_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_multiple%20copy/customer_create_multiple.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_multiple%20copy/customer_create_multiple_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_delete_blueray/customer_delete_blueray.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_delete_blueray/customer_delete_blueray_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_list_blueray/customer_list_blueray.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_update_blueray/customer_update_blueray.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_update_blueray/customer_update_blueray_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/get_primary_address/get_primary_address.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/post_primary_address/post_primary_address.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/post_primary_address/post_primary_address_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/postcode_validation/postcode_validation.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/postcode_validation/postcode_validation_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/subdistrict_search/subdistrict_search.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/subdistrict_search/subdistrict_search_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/upload_file/upload_file.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/upload_file/upload_file_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/upload_image/upload_image.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/upload_image/upload_image_param.dart';

part 'address_event.dart';
part 'address_state.dart';
part 'address_bloc.freezed.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final CustomerListBluerayUseCase _customerListBluerayUseCase;
  final CustomerCreateBluerayUseCase _customerCreateBluerayUseCase;
  final CustomerCreateMultipleUseCase _customerCreateMultipleUseCase;
  final CustomerDeleteBluerayUseCase _customerDeleteBluerayUseCase;
  final CustomerUpdateBluerayUseCase _customerUpdateBluerayUseCase;
  final SubdistrictSearchUseCase _subdistrictSearchUseCase;
  final GetPrimaryAddressUseCase _getPrimaryAddressUseCase;
  final PostcodeValidationUseCase _postcodeValidationUseCase;
  final PostPrimaryAddressUseCase _postPrimaryAddressUseCase;
  final UploadFileUseCase _uploadFileUseCase;
  final UploadImageUseCase _uploadImageUseCase;

  AddressBloc(
    this._customerListBluerayUseCase,
    this._customerCreateBluerayUseCase,
    this._customerDeleteBluerayUseCase,
    this._customerUpdateBluerayUseCase,
    this._subdistrictSearchUseCase,
    this._getPrimaryAddressUseCase,
    this._postcodeValidationUseCase,
    this._postPrimaryAddressUseCase,
    this._uploadFileUseCase,
    this._uploadImageUseCase,
    this._customerCreateMultipleUseCase,
  ) : super(const AddressState()) {
    on<_CustomerListBlueray>((event, emit) async {
      emit(state.copyWith(
        isGetAddressListLoading: true,
        getAddressListError: null,
        isPostAddressLoading: true,
        postAddressError: null,
        postAddressSuccess: false,
      ));

      final result = await _customerListBluerayUseCase(null);

      result.fold(
        (e) => emit(state.copyWith(
          isGetAddressListLoading: false,
          getAddressListError: e,
        )),
        (data) {
          emit(state.copyWith(
            isGetAddressListLoading: false,
            getAddressList: data,
          ));
        },
      );
    });

    on<_CustomerCreateBlueray>((event, emit) async {
      emit(state.copyWith(
        isPostAddressLoading: true,
        postAddressError: null,
      ));

      final result = await _customerCreateBluerayUseCase(
        event.param,
      );

      result.fold(
        (e) => emit(state.copyWith(
          isPostAddressLoading: false,
          postAddressError: e,
        )),
        (data) => emit(state.copyWith(
          isPostAddressLoading: false,
          postAddressSuccess: true,
        )),
      );
    });

    on<_CustomerCreateMultipleBlueray>((event, emit) async {
      emit(state.copyWith(
        isPostAddressMultipleLoading: true,
        postAddressMultipleError: null,
      ));

      final result = await _customerCreateMultipleUseCase(event.param);

      result.fold(
        (e) => emit(state.copyWith(
          isPostAddressMultipleLoading: false,
          postAddressMultipleError: e,
        )),
        (data) => emit(state.copyWith(
          isPostAddressMultipleLoading: false,
          postAddressMultipleSuccess: true,
        )),
      );
    });

    on<_SubDistrictSearch>((event, emit) async {
      emit(state.copyWith(
        isSubDistrictSearchLoading: true,
        subDistrictSearchError: null,
      ));
      final result = await _subdistrictSearchUseCase(event.query);
      result.fold(
        (e) => emit(state.copyWith(
          isSubDistrictSearchLoading: false,
          subDistrictSearchError: e,
        )),
        (data) => emit(state.copyWith(
          isSubDistrictSearchLoading: false,
          subDistrictSearchList: data,
        )),
      );
    });

    on<_PostcodeValidation>((event, emit) async {
      emit(state.copyWith(
        isPostcodeValidationLoading: true,
        postcodeValidationError: null,
        isPostcodeValidationSuccess: false,
      ));
      final result = await _postcodeValidationUseCase(event.param);
      result.fold(
        (e) => emit(state.copyWith(
          isPostcodeValidationLoading: false,
          postcodeValidationError: e,
        )),
        (data) => emit(state.copyWith(
          isPostcodeValidationLoading: false,
          isPostcodeValidationSuccess: true,
        )),
      );
    });

    on<_CustomerDeleteBlueray>((event, emit) async {
      emit(state.copyWith(
        isDeleteAddressLoading: true,
        deleteAddressError: null,
        deleteAddressSuccess: false,
      ));

      final result = await _customerDeleteBluerayUseCase(event.param);

      result.fold(
        (e) => emit(state.copyWith(
          isDeleteAddressLoading: false,
          deleteAddressError: e,
        )),
        (data) => emit(state.copyWith(
          isDeleteAddressLoading: false,
          deleteAddressSuccess: true,
        )),
      );
    });

    on<_CustomerUpdateBlueray>((event, emit) async {
      emit(state.copyWith(
        isUpdateAddressLoading: true,
        updateAddressError: null,
        updateAddressSuccess: false,
      ));

      final result = await _customerUpdateBluerayUseCase(event.param);

      result.fold(
        (e) => emit(state.copyWith(
          isUpdateAddressLoading: false,
          updateAddressError: e,
        )),
        (data) => emit(state.copyWith(
          isUpdateAddressLoading: false,
          updateAddressSuccess: true,
        )),
      );
    });

    on<_GetPrimaryAddress>((event, emit) async {
      emit(state.copyWith(
        isGetPrimaryAddressLoading: true,
        getPrimaryAddressError: null,
        getPrimaryAddressSuccess: null,
      ));

      final result = await _getPrimaryAddressUseCase(null);

      result.fold(
        (e) => emit(state.copyWith(
          isGetPrimaryAddressLoading: false,
          getPrimaryAddressError: e,
        )),
        (data) => emit(state.copyWith(
          isGetPrimaryAddressLoading: false,
          getPrimaryAddressSuccess: data,
        )),
      );
    });

    on<_PostPrimaryAddress>((event, emit) async {
      emit(state.copyWith(
        isPostPrimaryAddressLoading: true,
        postPrimaryAddressError: null,
        postPrimaryAddressSuccess: false,
      ));

      final result = await _postPrimaryAddressUseCase(event.param);

      result.fold(
        (e) => emit(state.copyWith(
          isPostPrimaryAddressLoading: false,
          postPrimaryAddressError: e,
        )),
        (data) => emit(state.copyWith(
          isPostPrimaryAddressLoading: false,
          postPrimaryAddressSuccess: true,
        )),
      );
    });

    on<_UploadFileImage>((event, emit) async {
      emit(state.copyWith(
        isUploadFileImageLoading: true,
        uploadFileImageError: null,
      ));

      final extension =
          event.fileImage.toLowerCase().split('.').last.toLowerCase();

      final isImg =
          ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(extension);

      if (!isImg) {
        final result = await _uploadFileUseCase(
            UploadFileParam(fileName: event.fileImage));
        result.fold(
          (e) => emit(state.copyWith(
            isUploadFileImageLoading: false,
            uploadFileImageError: e,
          )),
          (data) => emit(state.copyWith(
            isUploadFileImageLoading: false,
            uploadFileImageSuccess: data,
          )),
        );
      } else {
        final result = await _uploadImageUseCase(
            UploadImageParam(imageName: event.fileImage));
        result.fold(
          (e) => emit(state.copyWith(
            isUploadFileImageLoading: false,
            uploadFileImageError: e,
          )),
          (data) => emit(state.copyWith(
            isUploadFileImageLoading: false,
            uploadFileImageSuccess: data,
          )),
        );
      }
    });

    on<_IndexSearchAddress>((event, emit) {
      emit(state.copyWith(
        indexSearchAddress: event.param,
      ));
    });

    on<_MapAddress>((event, emit) async {
      if (state.mapPoint != null) {
        await event.mapController.removeMarker(state.mapPoint!);
      }

      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          event.point.latitude,
          event.point.longitude,
        );

        final components = [
          placemarks[0].street,
          placemarks[0].subLocality,
          placemarks[0].subAdministrativeArea,
          placemarks[0].administrativeArea,
          placemarks[0].postalCode,
          placemarks[0].country,
        ];

        await event.mapController.removeLastRoad();
        await event.mapController.addMarker(event.point);

        emit(state.copyWith(
          mapAddress:
              components.where((e) => e != null && e.isNotEmpty).join(', '),
          mapPoint: event.point,
        ));
      } catch (e) {
        emit(state.copyWith(
          mapAddressError: "Gagal mendapatkan alamat: $e",
        ));
      }
    });

    on<_MapData>((event, emit) {
      emit(state.copyWith(
        mapData: event.data,
      ));
    });

    on<_AddAddressMultiple>((event, emit) {
      emit(state.copyWith(
        address: [...state.address, event.data],
      ));
    });

    on<_ClearData>((event, emit) {
      if (event.customerDeleteBlueray) {
        emit(state.copyWith(
          deleteAddressSuccess: false,
          deleteAddressError: null,
          isDeleteAddressLoading: false,
        ));
      }
      if (event.postcodeValidation) {
        emit(state.copyWith(
          isPostcodeValidationSuccess: false,
          postcodeValidationError: null,
          isPostcodeValidationLoading: false,
        ));
      }
      if (event.subDistrictSearch) {
        emit(state.copyWith(
          subDistrictSearchList: const [],
          isSubDistrictSearchLoading: false,
          subDistrictSearchError: null,
          indexSearchAddress: null,
        ));
      }
      if (event.customerCreateBlueray) {
        emit(state.copyWith(
          postAddressSuccess: false,
          postAddressError: null,
          isPostAddressLoading: false,
        ));
      }
      if (event.customerUpdateBlueray) {
        emit(state.copyWith(
          updateAddressSuccess: false,
          updateAddressError: null,
          isUpdateAddressLoading: false,
        ));
      }
      if (event.getPrimaryAddress) {
        emit(state.copyWith(
          getPrimaryAddressSuccess: null,
          getPrimaryAddressError: null,
          isGetPrimaryAddressLoading: false,
        ));
      }
      if (event.postPrimaryAddress) {
        emit(state.copyWith(
          postPrimaryAddressSuccess: false,
          postPrimaryAddressError: null,
          isPostPrimaryAddressLoading: false,
        ));
      }
      if (event.uploadFileImage) {
        emit(state.copyWith(
          uploadFileImageSuccess: null,
          uploadFileImageError: null,
          isUploadFileImageLoading: false,
        ));
      }
      if (event.mapAddress) {
        emit(state.copyWith(
          mapAddress: null,
          mapPoint: null,
          mapAddressError: null,
        ));
      }
      if (event.mapData) {
        emit(state.copyWith(
          mapData: null,
        ));
      }
      if (event.addAddressMultiple) {
        emit(state.copyWith(
          address: const [],
        ));
      }
      if (event.customerCreateMultipleBlueray) {
        emit(state.copyWith(
          isPostAddressMultipleLoading: false,
          postAddressMultipleError: null,
          postAddressMultipleSuccess: false,
        ));
      }
    });
  }
}
