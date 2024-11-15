import 'package:flutter/material.dart';
import 'package:kalamullah/constants/constants.dart';
import 'package:kalamullah/models/surah_translation.dart';
import 'package:kalamullah/services/api_services.dart';
import 'package:kalamullah/widgets/translation_tile.dart';

class SurahDetail extends StatelessWidget {
  SurahDetail({super.key});

  static const String id = 'surahDetail_screen';
  final ApiServices _apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _apiServices.getTranslation(Indexes.surahIndex!),
          builder: (BuildContext context,
              AsyncSnapshot<SurahTranslationList> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.error_outline_sharp,
                        color: gClr,
                        size: 8,
                      ),
                      Text(
                        "No Internet Connection",
                        style: theme.textTheme.titleSmall,
                      )
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: cpi,
                );
              case ConnectionState.active:
                return const Center(
                  child: cpi,
                );
              case ConnectionState.done:
                return ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context, index) {
                    return TranslationTile(
                      index: index,
                      surahTranslation: snapshot.data!.translationList[index],
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
