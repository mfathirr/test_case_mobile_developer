part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.customerListBlueray() = _CustomerListBlueray;
  const factory AddressEvent.customerCreateBlueray({
    required CustomerCreateBluerayParam param,
  }) = _CustomerCreateBlueray;
  const factory AddressEvent.subDistrictSearch({
    required SubdistrictSearchParam query,
  }) = _SubDistrictSearch;
  const factory AddressEvent.postcodeValidation({
    required PostcodeValidationParam param,
  }) = _PostcodeValidation;
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
  const factory AddressEvent.clearData({
    @Default(false) bool customerDeleteBlueray,
    @Default(false) bool postcodeValidation,
    @Default(false) bool subDistrictSearch,
    @Default(false) bool customerCreateBlueray,
    @Default(false) bool customerUpdateBlueray,
    @Default(false) bool getPrimaryAddress,
    @Default(false) bool postPrimaryAddress,
  }) = _ClearData;
}
