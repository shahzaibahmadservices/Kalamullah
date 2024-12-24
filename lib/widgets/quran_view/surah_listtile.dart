import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:kalamullah/models/surah.dart';

Widget surahListTile({
  required Surah surah,
  required BuildContext context,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: wClr,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: gClr.withAlpha(100),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ]),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: gClr),
              child: Center(
                child: Text(surah.number.toString(), style: w12b),
              ),
            ),
            const SizedBox(height: 5),
            Text(surah.name!, style: arg20b),
          ],
        ),
      ),
    ),
  );
}
