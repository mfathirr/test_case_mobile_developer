class CustomerAddressParam {
  final String address;
  final String name;
  final String phoneNumber;
  final int provinceId;
  final int districtId;
  final int subDistrictId;
  final String postalCode;
  final String? addressLabel;
  final String? email;
  final String? lat;
  final String? long;
  final String? addressMap;
  final String? npwp;
  final String? npwpFile;

  CustomerAddressParam({
    required this.address,
    required this.name,
    required this.phoneNumber,
    required this.provinceId,
    required this.districtId,
    required this.subDistrictId,
    required this.postalCode,
    this.addressLabel,
    this.email,
    this.lat,
    this.long,
    this.addressMap,
    this.npwp,
    this.npwpFile,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'name': name,
      'phone_number': phoneNumber,
      'province_id': provinceId,
      'district_id': districtId,
      'sub_district_id': subDistrictId,
      'postal_code': postalCode,
      if (addressLabel != null) 'address_label': addressLabel,
      if (email != null) 'email': email,
      if (lat != null) 'lat': double.tryParse(lat!),
      if (long != null) 'long': double.tryParse(long!),
      if (addressMap != null) 'address_map': addressMap,
      if (npwp != null) 'npwp': npwp,
      if (npwpFile != null) 'npwp_file': npwpFile,
    };
  }
}
