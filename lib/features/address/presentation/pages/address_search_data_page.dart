import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/core/widget/text_field_widget.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/subdistrict_search/subdistrict_search_param.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';

class AddressSearchDataPage extends StatefulWidget {
  static const String routeName = 'address_search_data_page';
  const AddressSearchDataPage({super.key});

  @override
  State<AddressSearchDataPage> createState() => _AddressSearchDataPageState();
}

class _AddressSearchDataPageState extends State<AddressSearchDataPage> {
  final TextEditingController _searchController = TextEditingController();
  int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Alamat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            TextFieldWidget(
              hintText: 'Cari Alamat',
              controller: _searchController,
              onSubmitted: (data) {
                context.read<AddressBloc>().add(AddressEvent.subDistrictSearch(
                        query: SubdistrictSearchParam(
                      search: data,
                    )));
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.subDistrictSearchList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _currentIndex == index
                                ? Colors.grey[600]!
                                : Colors.grey[200]!,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        duration: const Duration(milliseconds: 200),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Alamat',
                                  style:
                                      AppTheme.jakartaSansTextTheme.titleSmall,
                                ),
                                Text(
                                  state.subDistrictSearchList[index].address,
                                  style:
                                      AppTheme.jakartaSansTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Provinsi',
                                  style:
                                      AppTheme.jakartaSansTextTheme.titleSmall,
                                ),
                                Text(
                                  state.subDistrictSearchList[index].province,
                                  style:
                                      AppTheme.jakartaSansTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kabupaten/Kota',
                                  style:
                                      AppTheme.jakartaSansTextTheme.titleSmall,
                                ),
                                Text(
                                  state.subDistrictSearchList[index].district,
                                  style:
                                      AppTheme.jakartaSansTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kecamatan/Kelurahan',
                                  style:
                                      AppTheme.jakartaSansTextTheme.titleSmall,
                                ),
                                Text(
                                  state
                                      .subDistrictSearchList[index].subDistrict,
                                  style:
                                      AppTheme.jakartaSansTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kode Kecamatan/Kelurahan',
                                  style:
                                      AppTheme.jakartaSansTextTheme.titleSmall,
                                ),
                                Text(
                                  state.subDistrictSearchList[index]
                                      .subDistrictCode,
                                  style:
                                      AppTheme.jakartaSansTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 16,
                  ),
                );
              },
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
        child: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            return SizedBox(
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
                onPressed: _currentIndex != null
                    ? () {
                        context
                            .pop(state.subDistrictSearchList[_currentIndex!]);
                      }
                    : null,
                child: Text(
                  'Pilih',
                  style: AppTheme.jakartaSansTextTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
