import 'package:flutter/material.dart';
import 'package:kalamullah/constants/constants.dart';

class Btn extends StatelessWidget {
  final String txt;
  final VoidCallback onPressed;

  const Btn({super.key, required this.txt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        height: 36,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(gClr),
          ),
          child: Text(
            txt,
            style: const TextStyle(
                color: wClr, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
