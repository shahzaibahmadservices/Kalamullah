import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:kalamullah/models/surah_translation.dart';

class TranslationTile extends StatelessWidget {
  final int index;
  final SurahTranslation surahTranslation;

  const TranslationTile(
      {super.key, required this.index, required this.surahTranslation});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: wClr,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            shadowBox,
          ],
        ),
        child: Text(surahTranslation.arabic_text!,
            textDirection: TextDirection.rtl, style: arg24),
      ),
    );
  }
}
