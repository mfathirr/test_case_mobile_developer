class CustomerCreateMultipleParam {
  final String address;
  final String addressLabel;
  final String name;
  final String phoneNumber;
  final String email;
  final int provinceId;
  final int districtId;
  final int subDistrictId;
  final String postalCode;
  final String lat;
  final String long;
  final String addressMap;
  final String? npwp;
  final String? npwpFile;

  CustomerCreateMultipleParam({
    required this.address,
    required this.addressLabel,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.provinceId,
    required this.districtId,
    required this.subDistrictId,
    required this.postalCode,
    required this.lat,
    required this.long,
    required this.addressMap,
    this.npwp,
    this.npwpFile,
  });
}
