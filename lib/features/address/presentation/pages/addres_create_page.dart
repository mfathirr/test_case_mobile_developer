import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/core/widget/text_field_widget.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/sub_district_search_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_blueray/customer_create_blueray_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/postcode_validation/postcode_validation_param.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_map_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_search_data_page.dart';

class AddresCreatePage extends StatefulWidget {
  static const String routeName = 'address_create_page';
  const AddresCreatePage({super.key});

  @override
  State<AddresCreatePage> createState() => _AddresCreatePageState();
}

class _AddresCreatePageState extends State<AddresCreatePage> {
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
    _pinAddressController.text = 'Pin Alamat';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state.postAddressSuccess) {
          context
              .read<AddressBloc>()
              .add(const AddressEvent.clearData(customerCreateBlueray: true));
          context
              .read<AddressBloc>()
              .add(const AddressEvent.customerListBlueray());
          context.pop();
        }

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
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Alamat'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              TextFieldWidget(
                hintText: 'Label Alamat',
                controller: _labelController,
              ),
              const SizedBox(height: 12),
              TextFieldWidget(
                hintText: 'Nama Penerima',
                controller: _nameController,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 12),
              TextFieldWidget(
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
              if (_provinceController.text.isNotEmpty) ...[
                const SizedBox(height: 12),
                TextFieldWidget(
                  hintText: 'Kota',
                  controller: _districtController,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  hintText: 'Kecamatan',
                  controller: _subDistrictController,
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: 'Kode Pos',
                      controller: _postalCodeController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 6),
                  SizedBox(
                    height: 53,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _postalCodeController.text.isNotEmpty
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
                        style:
                            AppTheme.jakartaSansTextTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_rounded,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: Text(
                        _pinAddressController.text,
                        style: AppTheme.jakartaSansTextTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (_pinAddressController.text.contains('Pin Alamat'))
                      const Spacer()
                    else
                      const SizedBox(width: 6),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        final data = await context
                            .pushNamed(AddressMapPage.routeName) as Map?;

                        if (data != null) {
                          _latController.text = data['lat'].toString();
                          _longController.text = data['long'].toString();
                          _pinAddressController.text = data['address'];
                        }
                      },
                      child: Text(
                        'Pin',
                        style:
                            AppTheme.jakartaSansTextTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
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
                context.read<AddressBloc>().add(
                      AddressEvent.customerCreateBlueray(
                        param: CustomerCreateBluerayParam(
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
                          lat: _latController.text,
                          long: _longController.text,
                          addressMap: _pinAddressController.text,
                        ),
                      ),
                    );
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
