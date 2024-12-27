import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableExpandedWidget extends StatelessWidget {
  final String txt;
  final IconData? icon;
  final GestureTapCallback onTap;
  const ReusableExpandedWidget(
      {super.key, required this.txt, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: wClr,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              shadowBox,
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, color: gClr),
              Text(txt, style: g16),
            ],
          ),
        ),
      ),
    );
  }
}
