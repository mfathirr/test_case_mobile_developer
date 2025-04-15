import 'package:flutter/material.dart';

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
  });

  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final bool obscureText;
  final void Function()? onTap;
  final void Function(String data)? onSubmitted;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (data) => onSubmitted?.call(data),
      onTap: onTap,
      controller: controller,
      readOnly: readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: const Color(0xff6C7278),
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
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
