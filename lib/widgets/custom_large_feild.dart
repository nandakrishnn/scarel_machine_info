import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldLarge extends StatelessWidget {
  CustomTextFieldLarge({
    required this.hintText,
    this.suffixButton,
    this.suffix,
    this.prefixIcon,
    this.controller,
    this.focusNode, // Added optional FocusNode
    super.key,
    this.onChanged,
    required this.obscure,
    this.validator,
  });

  String hintText;
  Widget? suffix;
  bool obscure;
  Icon? suffixButton;
  Icon? prefixIcon;
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  FocusNode? focusNode; // FocusNode added here

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode, // Use the optional FocusNode
      onChanged: onChanged,
      obscureText: obscure,
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Color.fromARGB(255, 214, 214, 214)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Color.fromARGB(255, 214, 214, 214)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Color.fromARGB(255, 171, 161, 161)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Colors.orange),
        ),
        border: OutlineInputBorder(
          gapPadding: 4,
          borderSide: const BorderSide(strokeAlign: BorderSide.strokeAlignCenter),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 174, 169, 169)),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffixButton,
        prefixIcon: prefixIcon,
        // Adjust the content padding to increase the height
        contentPadding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 12.0), // Increase vertical padding
      ),
    );
  }
}
