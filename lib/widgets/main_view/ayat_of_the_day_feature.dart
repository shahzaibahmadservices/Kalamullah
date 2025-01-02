import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:kalamullah/services/quran_api_services.dart';
import 'package:kalamullah/models/ayat_of_the_day.dart';

final QuranAPIServices quranAPIServices = QuranAPIServices();

FutureBuilder<AyatOfTheDay> ayatOfTheDayFeature() {
  return FutureBuilder<AyatOfTheDay>(
    future: quranAPIServices.getAyatOfTheDay(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return const Center(child: syncproblem);
        case ConnectionState.waiting:
          return const Center(child: progressIndicator);
        case ConnectionState.active:
          return const Center(child: sync);
        case ConnectionState.done:
          if (snapshot.hasError) {
            return Center(
                child: Column(
              children: [
                signalWifiOff,
                Text("No Internet Connection", style: g16)
              ],
            ));
          } else if (snapshot.hasData) {
            final ayat = snapshot.data!;
            return Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 12, bottom: 2),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: wClr,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [shadowBox],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text("Ayat of the Day", style: g16),
                  const Divider(color: gClr, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 3),
                    child: Text(
                      ayat.arTxt!,
                      style: arg24,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child:
                                Text(ayat.surahNumber!.toString(), style: g16),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(ayat.surahName!, style: g16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: progressIndicator,
            );
          }
      }
    },
  );
}
