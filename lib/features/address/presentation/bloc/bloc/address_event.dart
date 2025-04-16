part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.customerListBlueray() = _CustomerListBlueray;
  const factory AddressEvent.customerLoadMoreListBlueray() =
      _CustomerLoadMoreListBlueray;
  const factory AddressEvent.customerCreateBlueray({
    required CustomerCreateBluerayParam param,
  }) = _CustomerCreateBlueray;
  const factory AddressEvent.subDistrictSearch({
    required SubdistrictSearchParam query,
  }) = _SubDistrictSearch;
  const factory AddressEvent.postcodeValidation({
    required PostcodeValidationParam param,
  }) = _PostcodeValidation;
  // Post Multiple Address
  const factory AddressEvent.customerCreateMultipleBlueray({
    required List<CustomerCreateMultipleParam> param,
  }) = _CustomerCreateMultipleBlueray;
  const factory AddressEvent.customerDeleteBlueray({
    required CustomerDeleteBluerayParam param,
  }) = _CustomerDeleteBlueray;
  const factory AddressEvent.customerUpdateBlueray({
    required CustomerUpdateBluerayParam param,
  }) = _CustomerUpdateBlueray;
  const factory AddressEvent.getPrimaryAddress() = _GetPrimaryAddress;
  const factory AddressEvent.postPrimaryAddress({
    required PostPrimaryAddressParam param,
  }) = _PostPrimaryAddress;
  const factory AddressEvent.uploadFileImage({
    required String fileImage,
  }) = _UploadFileImage;
  const factory AddressEvent.indexSearchAddress({
    required int param,
  }) = _IndexSearchAddress;
  const factory AddressEvent.mapAddress({
    required GeoPoint point,
    required MapController mapController,
  }) = _MapAddress;
  const factory AddressEvent.mapData({
    required Map<String, dynamic> data,
  }) = _MapData;
  const factory AddressEvent.addAddressMultiple({
    required CustomerCreateBluerayParam data,
  }) = _AddAddressMultiple;
  const factory AddressEvent.clearData({
    @Default(false) bool customerDeleteBlueray,
    @Default(false) bool postcodeValidation,
    @Default(false) bool subDistrictSearch,
    @Default(false) bool customerCreateBlueray,
    @Default(false) bool customerUpdateBlueray,
    @Default(false) bool getPrimaryAddress,
    @Default(false) bool postPrimaryAddress,
    @Default(false) bool uploadFileImage,
    @Default(false) bool mapAddress,
    @Default(false) bool mapData,
    @Default(false) bool addAddressMultiple,
    @Default(false) bool customerCreateMultipleBlueray,
  }) = _ClearData;
}
