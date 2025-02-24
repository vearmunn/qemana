// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../core/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hint,
    this.prefix,
    this.suffix,
    required this.controller,
    this.label,
    this.inputType = TextInputType.text,
    this.obscure = false,
    this.padding = 20,
  });

  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController controller;
  final String? label;
  final TextInputType inputType;
  final bool obscure;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextField(
        obscureText: obscure,
        keyboardType: inputType,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            prefixIcon: prefix,
            suffixIcon: suffix,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]!),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: mainColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[400]!))),
      ),
    );
  }
}
