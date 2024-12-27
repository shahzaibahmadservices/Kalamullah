import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:kalamullah/consts/surah_index.dart';
import 'package:kalamullah/services/quran_api_services.dart';
import 'package:kalamullah/models/surah_translation.dart';
import 'package:kalamullah/widgets/quran_view/translation_tile.dart';

class SurahDetail extends StatelessWidget {
  SurahDetail({super.key});

  static const String id = 'surahDetail_screen';
  final QuranAPIServices quranAPIServices = QuranAPIServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wClr,
      body: FutureBuilder(
        future: quranAPIServices.getSurahTranslation(Indexes.surahIndex!),
        builder: (BuildContext context,
            AsyncSnapshot<SurahTranslationList> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(child: syncproblem);
            case ConnectionState.waiting:
              return const Center(child: progressIndicator);
            case ConnectionState.active:
              return const Center(child: sync);
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(child: signalWifiOff);
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context, index) {
                    AnimationController controller = AnimationController(
                      duration: const Duration(milliseconds: 700),
                      vsync: Scaffold.of(context),
                    );
                    Animation<double> animation = CurvedAnimation(
                      parent: controller,
                      curve: Curves.easeIn,
                    );
                    controller.forward();
                    return FadeTransition(
                      opacity: animation,
                      child: TranslationTile(
                        index: index,
                        surahTranslation: snapshot.data!.translationList[index],
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: progressIndicator);
              }
          }
        },
      ),
    );
  }
}
