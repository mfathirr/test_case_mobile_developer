part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    // Get Customer Address List Blueray
    @Default(false) bool isGetAddressListLoading,
    String? getAddressListError,
    @Default([]) List<CustomerAddressEntity> getAddressList,

    // Post Customer Address
    @Default(false) bool isPostAddressLoading,
    String? postAddressError,
    @Default(false) bool postAddressSuccess,

    // SubDistrict Search
    @Default(false) bool isSubDistrictSearchLoading,
    String? subDistrictSearchError,
    @Default([]) List<SubDistrictsSearchEntity> subDistrictSearchList,

    // Postcode Validation
    @Default(false) bool isPostcodeValidationLoading,
    String? postcodeValidationError,
    @Default(false) bool isPostcodeValidationSuccess,

    // Delete Address
    @Default(false) bool isDeleteAddressLoading,
    String? deleteAddressError,
    @Default(false) bool deleteAddressSuccess,

    // Update Address
    @Default(false) bool isUpdateAddressLoading,
    String? updateAddressError,
    @Default(false) bool updateAddressSuccess,

    // Get Primary Address
    @Default(false) bool isGetPrimaryAddressLoading,
    String? getPrimaryAddressError,
    CustomerAddressEntity? getPrimaryAddressSuccess,

    // Post Primary Address
    @Default(false) bool isPostPrimaryAddressLoading,
    String? postPrimaryAddressError,
    @Default(false) bool postPrimaryAddressSuccess,

    // Indexing
    int? indexSearchAddress,

    // Map
    String? mapAddress,
    String? mapAddressError,
    GeoPoint? mapPoint,
    Map<String, dynamic>? mapData,
  }) = _AddressState;
}
