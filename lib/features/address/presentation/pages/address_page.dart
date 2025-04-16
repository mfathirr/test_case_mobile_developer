import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/addres_create_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/widgets/address_item.dart';
import 'package:test_case_mobile_developer/features/address/presentation/widgets/shimmer_address_item.dart';

class AddressPage extends StatefulWidget {
  static const String routeName = 'address_page';
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(const AddressEvent.customerListBlueray());
    context.read<AddressBloc>().add(const AddressEvent.getPrimaryAddress());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state.deleteAddressSuccess) {
          context
              .read<AddressBloc>()
              .add(const AddressEvent.clearData(customerDeleteBlueray: true));
          context
              .read<AddressBloc>()
              .add(const AddressEvent.customerListBlueray());
          context
              .read<AddressBloc>()
              .add(const AddressEvent.getPrimaryAddress());
        } else if (state.deleteAddressError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.deleteAddressError!),
            ),
          );
        }

        if (state.postPrimaryAddressSuccess) {
          context
              .read<AddressBloc>()
              .add(const AddressEvent.clearData(postPrimaryAddress: true));
          context
              .read<AddressBloc>()
              .add(const AddressEvent.getPrimaryAddress());
          context
              .read<AddressBloc>()
              .add(const AddressEvent.customerListBlueray());
        } else if (state.postPrimaryAddressError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.postPrimaryAddressError!),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Alamat',
              style: AppTheme.jakartaSansTextTheme.headlineSmall,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                context.pushNamed(AddresCreatePage.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  'Add New',
                  style: AppTheme.jakartaSansTextTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              child: Text('Alamat Utama'),
            ),
            BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                return state.isGetPrimaryAddressLoading
                    ? const ShimmerAddressItem()
                    : state.getPrimaryAddressSuccess != null
                        ? AddressItem(data: state.getPrimaryAddressSuccess!)
                        : Center(
                            child: Text(
                            'Tidak ada alamat utama',
                            style: AppTheme.jakartaSansTextTheme.bodyMedium,
                          ));
              },
            ),
            const SizedBox(height: 12),
            Divider(
              color: Colors.grey[300],
              height: 24,
              thickness: 1,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Semua Alamat'),
            ),
            const SizedBox(height: 12),
            BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.isGetAddressListLoading
                      ? 3
                      : state.getAddressList.isEmpty
                          ? 1
                          : state.getAddressList.length,
                  itemBuilder: (context, index) {
                    return state.isGetAddressListLoading
                        ? const ShimmerAddressItem()
                        : state.getAddressList.isEmpty
                            ? Center(
                                child: Text(
                                'Tidak ada alamat',
                                style: AppTheme.jakartaSansTextTheme.bodyMedium,
                              ))
                            : AddressItem(
                                data: state.getAddressList[index],
                              );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 12),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
