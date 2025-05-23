import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/core/widget/text_field_widget.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/sub_district_search_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_blueray/customer_create_blueray_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/postcode_validation/postcode_validation_param.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_map_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_multiple_create_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_search_data_page.dart';

class AddresCreatePage extends StatefulWidget {
  static const String routeName = 'address_create_page';
  const AddresCreatePage({super.key});

  @override
  State<AddresCreatePage> createState() => _AddresCreatePageState();
}

class _AddresCreatePageState extends State<AddresCreatePage> {
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
  final TextEditingController _npwpFileImageController =
      TextEditingController();
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
        if (state.uploadFileImageSuccess != null) {
          context
              .read<AddressBloc>()
              .add(const AddressEvent.clearData(uploadFileImage: true));
          _npwpFileImageController.text = state.uploadFileImageSuccess!;
        }

        if (state.postAddressSuccess) {
          context
              .read<AddressBloc>()
              .add(const AddressEvent.clearData(customerCreateBlueray: true));
          if (state.getPrimaryAddressSuccess == null) {
            context
                .read<AddressBloc>()
                .add(const AddressEvent.getPrimaryAddress());
          }
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
      },
      child: PopScope(
        onPopInvoked: (didPop) {
          context
              .read<AddressBloc>()
              .add(const AddressEvent.clearData(addAddressMultiple: true));
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    context.pop();
                    context.read<AddressBloc>().add(
                        const AddressEvent.clearData(addAddressMultiple: true));
                  },
                  child: const Icon(Icons.arrow_back_ios_new_rounded, size: 19),
                ),
                const SizedBox(width: 10),
                const Text('Tambah Alamat'),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 24),
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
                      final data = await context
                              .pushNamed(AddressSearchDataPage.routeName)
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
                                  style: AppTheme
                                      .jakartaSansTextTheme.bodyMedium
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
                                    const Icon(Icons.pin_drop_rounded,
                                        size: 20),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                                : null) as Map<String,
                                            dynamic>?;

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
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          readOnly: true,
                          hintText: 'NPWP File',
                          controller: _npwpFileImageController,
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
                              horizontal: 12,
                              vertical: 7,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            await FilePicker.platform.pickFiles().then((value) {
                              if (value != null) {
                                context.read<AddressBloc>().add(
                                    AddressEvent.uploadFileImage(
                                        fileImage: value.files.single.path!));
                              }
                            });
                          },
                          child: Text(
                            'Unggah',
                            style: AppTheme.jakartaSansTextTheme.bodyMedium
                                ?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  BlocBuilder<AddressBloc, AddressState>(
                    builder: (context, state) {
                      return state.address.isNotEmpty
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 38),
                                SizedBox(
                                  height: 48,
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
                                    onPressed: () {
                                      final controllersToValidate = [
                                        _fullAddressController,
                                        _labelController,
                                        _nameController,
                                        _phoneController,
                                        _emailController,
                                        _provinceIdController,
                                        _districtIdController,
                                        _subDistrictIdController,
                                        _postalCodeController,
                                        _latController,
                                        _longController,
                                        _pinAddressController,
                                      ];

                                      if (controllersToValidate
                                          .any((c) => c.text.isEmpty)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              'Harap isi data terlebih dahulu'),
                                          duration: Duration(seconds: 2),
                                        ));
                                        return;
                                      }

                                      context.pushNamed(
                                        AddressMultipleCreatePage.routeName,
                                        extra: CustomerCreateBluerayParam(
                                          address: _fullAddressController.text,
                                          addressLabel: _labelController.text,
                                          name: _nameController.text,
                                          phoneNumber: _phoneController.text,
                                          email: _emailController.text,
                                          provinceId: int.parse(
                                              _provinceIdController.text),
                                          districtId: int.parse(
                                              _districtIdController.text),
                                          subDistrictId: int.parse(
                                              _subDistrictIdController.text),
                                          postalCode:
                                              _postalCodeController.text,
                                          lat: _latController.text,
                                          long: _longController.text,
                                          addressMap:
                                              _pinAddressController.text,
                                          npwp: _npwpController.text.isEmpty
                                              ? null
                                              : _npwpController.text,
                                          npwpFile: _npwpFileImageController
                                                  .text.isEmpty
                                              ? null
                                              : _npwpFileImageController.text,
                                        ),
                                      );

                                      final controllersToClear = [
                                        _labelController,
                                        _nameController,
                                        _phoneController,
                                        _emailController,
                                        _provinceController,
                                        _provinceIdController,
                                        _districtController,
                                        _districtIdController,
                                        _subDistrictController,
                                        _subDistrictIdController,
                                        _postalCodeController,
                                        _fullAddressController,
                                        _npwpController,
                                        _npwpFileImageController,
                                        _latController,
                                        _longController,
                                      ];

                                      for (final controller
                                          in controllersToClear) {
                                        controller.clear();
                                      }

                                      _pinAddressController.text = 'Pin Alamat';
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Buat lebih dari satu alamat langsung',
                                          style: AppTheme
                                              .jakartaSansTextTheme.bodyMedium
                                              ?.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.add_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                  const SizedBox(height: 24),
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
            child: BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                return SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (state.address.isNotEmpty) {
                        final controllersToValidate = [
                          _fullAddressController,
                          _labelController,
                          _nameController,
                          _phoneController,
                          _emailController,
                          _provinceIdController,
                          _districtIdController,
                          _subDistrictIdController,
                          _postalCodeController,
                          _latController,
                          _longController,
                          _pinAddressController,
                        ];

                        if (controllersToValidate.any((c) => c.text.isEmpty)) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Harap isi data terlebih dahulu'),
                            duration: Duration(seconds: 2),
                          ));
                          return;
                        }


                        context.pushNamed(
                          AddressMultipleCreatePage.routeName,
                          extra: CustomerCreateBluerayParam(
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
                            npwp: _npwpController.text.isEmpty
                                ? null
                                : _npwpController.text,
                            npwpFile: _npwpFileImageController.text.isEmpty
                                ? null
                                : _npwpFileImageController.text,
                          ),
                        );

                        final controllersToClear = [
                          _labelController,
                          _nameController,
                          _phoneController,
                          _emailController,
                          _provinceController,
                          _provinceIdController,
                          _districtController,
                          _districtIdController,
                          _subDistrictController,
                          _subDistrictIdController,
                          _postalCodeController,
                          _fullAddressController,
                          _npwpController,
                          _npwpFileImageController,
                          _latController,
                          _longController,
                        ];

                        for (final controller in controllersToClear) {
                          controller.clear();
                        }

                        _pinAddressController.text = 'Pin Alamat';
                      } else {
                        _formKey.currentState?.save();
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<AddressBloc>().add(
                                AddressEvent.customerCreateBlueray(
                                  param: CustomerCreateBluerayParam(
                                    address: _fullAddressController.text,
                                    addressLabel: _labelController.text,
                                    name: _nameController.text,
                                    phoneNumber: _phoneController.text,
                                    email: _emailController.text,
                                    provinceId:
                                        int.parse(_provinceIdController.text),
                                    districtId:
                                        int.parse(_districtIdController.text),
                                    subDistrictId: int.parse(
                                        _subDistrictIdController.text),
                                    postalCode: _postalCodeController.text,
                                    lat: _latController.text,
                                    long: _longController.text,
                                    addressMap: _pinAddressController.text,
                                    npwp: _npwpController.text.isEmpty
                                        ? null
                                        : _npwpController.text,
                                    npwpFile:
                                        _npwpFileImageController.text.isEmpty
                                            ? null
                                            : _npwpFileImageController.text,
                                  ),
                                ),
                              );
                        }
                      }
                    },
                    child: Text(
                      state.address.isEmpty ? 'Tambah' : 'Tambah Data',
                      style: AppTheme.jakartaSansTextTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
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
