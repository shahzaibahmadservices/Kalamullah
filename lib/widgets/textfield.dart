import 'package:flutter/material.dart';
import 'package:kalamullah/constants/constants.dart';

class Txtfield extends StatelessWidget {
  final String hinttext;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Icon prefixIcon;

  const Txtfield(
      {super.key,
      required this.hinttext,
      required this.keyboardType,
      required this.controller,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        enableSuggestions: false,
        autocorrect: false,
        keyboardType: keyboardType,
        style: theme.textTheme.bodySmall,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: theme.textTheme.bodySmall,
          prefixIcon: prefixIcon,
          prefixIconColor: gClr,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: gClr,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
