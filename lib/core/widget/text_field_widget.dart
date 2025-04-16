import 'package:flutter/material.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
    this.onChanged,
  });

  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final bool obscureText;
  final void Function()? onTap;
  final void Function(String data)? onSubmitted;
  final void Function(String data)? onChanged;
  final TextInputType keyboardType;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (data) => onSubmitted?.call(data),
      validator: (value) {
        if (isRequired) {
          if (value == null || value.isEmpty) {
            return 'Masukkan $hintText';
          }
        }

        return null;
      },
      onTap: onTap,
      onChanged: (data) => onChanged?.call(data),
      controller: controller,
      readOnly: readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: const Color(0xff6C7278),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTheme.jakartaSansTextTheme.titleSmall?.copyWith(
          color: const Color(0xff6C7278),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[800]!,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red[300]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
      ),
    );
  }
}
