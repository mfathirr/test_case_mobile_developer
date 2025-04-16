import 'package:flutter/material.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_blueray/customer_create_blueray_param.dart';

class AddressMultipleItem extends StatelessWidget {
  const AddressMultipleItem({
    super.key,
    required this.data,
  });

  final CustomerCreateBluerayParam data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200]!,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            _buildRow('Nama', data.name),
            const SizedBox(height: 6),
            _buildRow('No. Telepon', data.phoneNumber),
            const SizedBox(height: 6),
            _buildRow('Email', data.email),
            const SizedBox(height: 6),
            _buildRow('Alamat', data.address),
            const SizedBox(height: 6),
            _buildRow('Label Alamat', data.addressLabel),
            const SizedBox(height: 6),
            _buildRow('Kode Pos', data.postalCode),
            const SizedBox(height: 6),
            _buildRow('Latitude', data.lat),
            const SizedBox(height: 6),
            _buildRow('Longitude', data.long),
            const SizedBox(height: 6),
            _buildRow('Alamat Map', data.addressMap),
            if (data.npwp != null) ...[
              const SizedBox(height: 6),
              _buildRow('NPWP', data.npwp!),
            ],
            if (data.npwpFile != null) ...[
              const SizedBox(height: 6),
              _buildRow('NPWP File', data.npwpFile!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTheme.jakartaSansTextTheme.titleSmall),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            style: AppTheme.jakartaSansTextTheme.bodyMedium,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
