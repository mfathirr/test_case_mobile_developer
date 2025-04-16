import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/addres_create_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/widgets/address_item.dart';
import 'package:test_case_mobile_developer/features/address/presentation/widgets/shimmer_address_item.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/login_page.dart';

class AddressPage extends StatefulWidget {
  static const String routeName = 'address_page';
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(const AddressEvent.customerListBlueray());
    context.read<AddressBloc>().add(const AddressEvent.getPrimaryAddress());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context
            .read<AddressBloc>()
            .add(const AddressEvent.customerLoadMoreListBlueray());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddressBloc, AddressState>(
          listener: (context, state) {
            if (state.deleteAddressSuccess) {
              context.read<AddressBloc>().add(
                  const AddressEvent.clearData(customerDeleteBlueray: true));
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
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () => context.pushReplacementNamed(LoginPage.routeName),
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
          controller: _scrollController,
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
                final isLoading = state.isGetAddressListLoading;
                final addresses = state.paginatedCustomers;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: isLoading
                          ? 3
                          : addresses.isEmpty
                              ? 1
                              : addresses.length,
                      itemBuilder: (context, index) {
                        if (isLoading) return const ShimmerAddressItem();

                        if (addresses.isEmpty) {
                          return Center(
                            child: Text(
                              'Tidak ada alamat',
                              style: AppTheme.jakartaSansTextTheme.bodyMedium,
                            ),
                          );
                        }

                        return AddressItem(data: addresses[index]);
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                    ),
                    const SizedBox(height: 16),
                    if (!isLoading && !state.hasReachedMax)
                      Center(
                        child: state.hasReachedMax
                            ? const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              )
                            : const SizedBox(),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Keluar Aplikasi',
                        style: AppTheme.jakartaSansTextTheme.headlineSmall
                            ?.copyWith(color: Colors.red),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Apakah kamu yakin untuk keluar aplikasi?',
                        style: AppTheme.jakartaSansTextTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.customerLogout());
                              context.pop();
                            },
                            child: Text(
                              'keluar',
                              style: AppTheme.jakartaSansTextTheme.bodyLarge
                                  ?.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Text(
                              'kembali',
                              style: AppTheme.jakartaSansTextTheme.bodyLarge,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.logout_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
