import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:kalamullah/models/ayat_of_the_day.dart';
import 'package:kalamullah/services/api_services.dart';

final ApiServices _apiServices = ApiServices();

FutureBuilder<AyatOfTheDay> ayatOfTheDayFeature() {
  return FutureBuilder<AyatOfTheDay>(
    future: _apiServices.getAyatOfTheDay(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return const Center(child: syncproblem);
        case ConnectionState.waiting:
          return const Center(child: cpi);
        case ConnectionState.active:
          return const Center(child: sync);
        case ConnectionState.done:
          if (snapshot.hasError) {
            return const Center(child: signalWifiOff);
          } else if (snapshot.hasData) {
            final ayat = snapshot.data!;
            return Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 12, bottom: 2),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: wClr,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: gClr.withAlpha(100),
                    offset: const Offset(0, 6),
                    blurRadius: 7,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text("Ayat of the Day", style: g16b),
                  const Divider(color: gClr, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 3),
                    child: Text(ayat.arTxt!,
                        style: arg24b, textDirection: TextDirection.rtl),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child:
                                Text(ayat.surahNumber!.toString(), style: g16b),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(ayat.surahName!, style: g16b),
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
              child: cpi,
            );
          }
      }
    },
  );
}
