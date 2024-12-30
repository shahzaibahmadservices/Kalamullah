import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Search Surah',
            hintStyle: g16,
            prefixIcon: const Icon(
              Icons.search_outlined,
              color: gClr,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(
                color: gClr,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(
                color: gClr,
                width: 2,
              ),
            ),
          ),
          style: g16,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
