import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/customer_list_address_blueray_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/get_primary_address_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_delete_blueray/customer_delete_blueray_param.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/post_primary_address/post_primary_address_param.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/addres_update_page.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.data,
    this.primaryAddress,
  });

  final CustomerAddressEntity data;
  final GetPrimaryAddressEntity? primaryAddress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (data.isPrimary) {
                        return;
                      }
                      context.read<AddressBloc>().add(
                            AddressEvent.postPrimaryAddress(
                                param: PostPrimaryAddressParam(
                                    addressId: data.addressId)),
                          );
                    },
                    child: Icon(
                      Icons.star_rounded,
                      color: data.isPrimary
                          ? Colors.yellow[600]
                          : Colors.grey[400],
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      "${data.name}${data.addressLabel.isEmpty ? '' : ' - ${data.addressLabel}'}",
                      style: AppTheme.jakartaSansTextTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(
                        AddresUpdatePage.routeName,
                        extra: data,
                      );
                    },
                    child: const Icon(
                      Icons.edit_location_alt_rounded,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
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
                                  'Hapus Alamat',
                                  style: AppTheme
                                      .jakartaSansTextTheme.headlineSmall
                                      ?.copyWith(color: Colors.red),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Apakah kamu yakin untuk menghapus ${data.name}${data.addressLabel.isEmpty ? '' : ' - ${data.addressLabel}'}?',
                                  style:
                                      AppTheme.jakartaSansTextTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context.pop();
                                        context.read<AddressBloc>().add(
                                            AddressEvent.customerDeleteBlueray(
                                                param:
                                                    CustomerDeleteBluerayParam(
                                                        addressId:
                                                            data.addressId)));
                                      },
                                      child: Text(
                                        'hapus',
                                        style: AppTheme
                                            .jakartaSansTextTheme.bodyLarge
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
                                        style: AppTheme
                                            .jakartaSansTextTheme.bodyLarge,
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
                    child: const Icon(
                      Icons.delete_rounded,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${data.address} ${data.subDistrictName} ${data.districtName} ${data.provinceName} ${data.postalCode}',
                style: AppTheme.jakartaSansTextTheme.bodySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
