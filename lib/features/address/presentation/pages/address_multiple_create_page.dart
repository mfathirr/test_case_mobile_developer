import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_blueray/customer_create_blueray_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_multiple%20copy/customer_create_multiple_param.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
import 'package:test_case_mobile_developer/features/address/presentation/widgets/address_multiple_item.dart';

class AddressMultipleCreatePage extends StatefulWidget {
  static const String routeName = 'address_multiple_create_page';
  final CustomerCreateBluerayParam? data;
  const AddressMultipleCreatePage({super.key, required this.data});

  @override
  State<AddressMultipleCreatePage> createState() =>
      _AddressMultipleCreatePageState();
}

class _AddressMultipleCreatePageState extends State<AddressMultipleCreatePage> {
  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      context
          .read<AddressBloc>()
          .add(AddressEvent.addAddressMultiple(data: widget.data!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state.postAddressMultipleSuccess) {
          context.read<AddressBloc>().add(const AddressEvent.clearData(
                customerCreateMultipleBlueray: true,
                addAddressMultiple: true,
              ));
          context
              .read<AddressBloc>()
              .add(const AddressEvent.customerListBlueray());
          context.pop();
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
                const Text('Buat Banyak Alamat'),
              ],
            ),
          ),
          body: BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 24),
                itemCount: state.address.length,
                itemBuilder: (context, index) {
                  return AddressMultipleItem(data: state.address[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 12),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pop();
            },
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            tooltip: 'Tambah Alamat',
            child: const Icon(
              Icons.add,
              color: Colors.white,
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
                      context
                          .read<AddressBloc>()
                          .add(AddressEvent.customerCreateMultipleBlueray(
                              param: state.address
                                  .map((data) => CustomerCreateMultipleParam(
                                        address: data.address,
                                        addressLabel: data.addressLabel,
                                        name: data.name,
                                        phoneNumber: data.phoneNumber,
                                        email: data.email,
                                        provinceId: data.provinceId,
                                        districtId: data.districtId,
                                        subDistrictId: data.subDistrictId,
                                        postalCode: data.postalCode,
                                        lat: data.lat,
                                        long: data.long,
                                        addressMap: data.addressMap,
                                      ))
                                  .toList()));
                    },
                    child: Text(
                      'Simpan Semua Alamat',
                      style: AppTheme.jakartaSansTextTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
