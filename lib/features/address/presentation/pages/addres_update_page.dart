import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/core/widget/text_field_widget.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/customer_list_address_blueray_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/sub_district_search_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_update_blueray/customer_update_blueray_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/postcode_validation/postcode_validation_param.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_map_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_search_data_page.dart';

class AddresUpdatePage extends StatefulWidget {
  static const String routeName = 'address_update_page';
  final CustomerAddressEntity data;
  const AddresUpdatePage({super.key, required this.data});

  @override
  State<AddresUpdatePage> createState() => _AddresUpdatePageState();
}

class _AddresUpdatePageState extends State<AddresUpdatePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isPostalCodeValid = ValueNotifier(false);

  final TextEditingController _labelController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _provinceIdController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _districtIdController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();
  final TextEditingController _subDistrictIdController =
      TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _fullAddressController = TextEditingController();
  final TextEditingController _npwpController = TextEditingController();
  final TextEditingController _pinAddressController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _labelController.text = widget.data.addressLabel;
    _nameController.text = widget.data.name;
    _phoneController.text = widget.data.phoneNumber;
    _emailController.text = widget.data.email;
    _provinceController.text = widget.data.provinceName;
    _provinceIdController.text = widget.data.provinceId.toString();
    _districtController.text = widget.data.districtName;
    _districtIdController.text = widget.data.districtId.toString();
    _subDistrictController.text = widget.data.subDistrictName;
    _subDistrictIdController.text = widget.data.subDistrictId.toString();
    _postalCodeController.text = widget.data.postalCode.toString();
    _fullAddressController.text = widget.data.address;
    _npwpController.text = widget.data.npwp ?? '';
    _pinAddressController.text = widget.data.addressMap;
    _latController.text = widget.data.lat.toString();
    _longController.text = widget.data.long.toString();
    isPostalCodeValid.value = _postalCodeController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state.postcodeValidationError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.postcodeValidationError!),
              duration: const Duration(seconds: 2),
            ),
          );
          context
              .read<AddressBloc>()
              .add(const AddressEvent.clearData(postcodeValidation: true));
          _postalCodeController.clear();
        }

        if (state.isPostcodeValidationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Kode Pos Valid'),
              duration: Duration(seconds: 2),
            ),
          );
          context
              .read<AddressBloc>()
              .add(const AddressEvent.clearData(postcodeValidation: true));
        }

        if (state.updateAddressSuccess) {
          context
              .read<AddressBloc>()
              .add(const AddressEvent.clearData(customerUpdateBlueray: true));
          context
              .read<AddressBloc>()
              .add(const AddressEvent.customerListBlueray());
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 19),
              ),
              const SizedBox(width: 10),
              const Text('Ubah Alamat'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFieldWidget(
                  hintText: 'Label Alamat',
                  controller: _labelController,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  isRequired: true,
                  hintText: 'Nama Penerima',
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  isRequired: true,
                  hintText: 'Nomor Telepon',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  hintText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  isRequired: true,
                  readOnly: true,
                  hintText: 'Provinsi',
                  controller: _provinceController,
                  onTap: () async {
                    final data =
                        await context.pushNamed(AddressSearchDataPage.routeName)
                            as SubDistrictsSearchEntity?;

                    if (data != null) {
                      _provinceController.text = data.province;
                      _districtController.text = data.district;
                      _subDistrictController.text = data.subDistrict;
                      _provinceIdController.text = data.provinceId.toString();
                      _districtIdController.text = data.districtId.toString();
                      _subDistrictIdController.text =
                          data.subDistrictId.toString();
                    }
                  },
                ),
                BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    return Column(
                      children: _provinceController.text.isNotEmpty
                          ? [
                              const SizedBox(height: 12),
                              TextFieldWidget(
                                isRequired: true,
                                readOnly: true,
                                hintText: 'Kota',
                                controller: _districtController,
                              ),
                              const SizedBox(height: 12),
                              TextFieldWidget(
                                isRequired: true,
                                readOnly: true,
                                hintText: 'Kecamatan',
                                controller: _subDistrictController,
                              ),
                            ]
                          : [],
                    );
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        isRequired: true,
                        hintText: 'Kode Pos',
                        controller: _postalCodeController,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          isPostalCodeValid.value = text.isNotEmpty;
                        },
                      ),
                    ),
                    const SizedBox(width: 6),
                    ValueListenableBuilder<bool>(
                        valueListenable: isPostalCodeValid,
                        builder: (context, isValid, _) {
                          return SizedBox(
                            height: 53,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 7,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: isValid
                                  ? () {
                                      context.read<AddressBloc>().add(
                                            AddressEvent.postcodeValidation(
                                              param: PostcodeValidationParam(
                                                postalCode: int.parse(
                                                  _postalCodeController.text,
                                                ),
                                              ),
                                            ),
                                          );
                                    }
                                  : null,
                              child: Text(
                                'Cek',
                                style: AppTheme.jakartaSansTextTheme.bodyMedium
                                    ?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  hintText: 'Alamat Lengkap',
                  controller: _fullAddressController,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  hintText: 'NPWP',
                  controller: _npwpController,
                ),
                const SizedBox(height: 12),
                BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    return FormField<String>(
                      initialValue: _pinAddressController.text,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value == 'Pin Alamat') {
                          return 'Pin Alamat tidak boleh kosong';
                        }

                        return null;
                      },
                      builder: (state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: state.hasError
                                      ? Colors.red[500]!
                                      : Colors.grey[300]!,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.pin_drop_rounded, size: 20),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      _pinAddressController.text,
                                      style: AppTheme
                                          .jakartaSansTextTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (_pinAddressController.text
                                      .contains('Pin Alamat'))
                                    const Spacer()
                                  else
                                    const SizedBox(width: 6),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 7,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () async {
                                      final bool isLatLong =
                                          _latController.text.isNotEmpty
                                              ? true
                                              : false;

                                      final data = await context.pushNamed(
                                          AddressMapPage.routeName,
                                          extra: isLatLong
                                              ? GeoPoint(
                                                  latitude: double.parse(
                                                      _latController.text),
                                                  longitude: double.parse(
                                                      _longController.text))
                                              : null) as Map<String, dynamic>?;

                                      if (data != null) {
                                        _latController.text =
                                            data['lat'].toString();
                                        _longController.text =
                                            data['long'].toString();
                                        _pinAddressController.text =
                                            data['address'];
                                      }
                                    },
                                    child: Text(
                                      'Pin',
                                      style: AppTheme
                                          .jakartaSansTextTheme.bodyMedium
                                          ?.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            if (state.hasError)
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 12),
                                child: Text(
                                  state.errorText ?? '',
                                  style: AppTheme
                                      .jakartaSansTextTheme.labelMedium
                                      ?.copyWith(
                                    color: Colors.red[600],
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, -10),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                _formKey.currentState?.save();
                if (_formKey.currentState?.validate() ?? false) {
                  context.read<AddressBloc>().add(
                        AddressEvent.customerUpdateBlueray(
                          param: CustomerUpdateBluerayParam(
                            address: _fullAddressController.text,
                            addressLabel: _labelController.text,
                            name: _nameController.text,
                            phoneNumber: _phoneController.text,
                            email: _emailController.text,
                            provinceId: int.parse(_provinceIdController.text),
                            districtId: int.parse(_districtIdController.text),
                            subDistrictId:
                                int.parse(_subDistrictIdController.text),
                            postalCode: _postalCodeController.text,
                            lat: double.parse(_latController.text),
                            long: double.parse(_longController.text),
                            addressMap: _pinAddressController.text,
                            addressId: widget.data.addressId.toString(),
                          ),
                        ),
                      );
                }
              },
              child: Text(
                'Simpan',
                style: AppTheme.jakartaSansTextTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _labelController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _provinceController.dispose();
    _provinceIdController.dispose();
    _districtController.dispose();
    _districtIdController.dispose();
    _subDistrictController.dispose();
    _subDistrictIdController.dispose();
    _postalCodeController.dispose();
    _fullAddressController.dispose();
    _npwpController.dispose();
    _pinAddressController.dispose();
    _latController.dispose();
    _longController.dispose();
  }
}
