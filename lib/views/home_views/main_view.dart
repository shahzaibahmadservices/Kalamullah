import 'package:flutter/material.dart';
import 'package:kalamullah/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kalamullah/models/ayat_of_the_day.dart';
import 'package:kalamullah/services/api_services.dart';
import 'package:hijri/hijri_calendar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final ApiServices _apiServices = ApiServices();

  void setData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    HijriCalendar hijriDate = HijriCalendar.now();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.36,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: bgImage,
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 235),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(hijriDate.hDay.toString(),
                        style: const TextStyle(
                            color: wClr,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    SizedBox(width: width * 0.02),
                    Text(hijriDate.longMonthName,
                        style: const TextStyle(
                            color: wClr,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    SizedBox(width: width * 0.02),
                    Text(hijriDate.hYear.toString(),
                        style: const TextStyle(
                            color: wClr,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    FutureBuilder<AyatOfTheDay>(
                      future: _apiServices.getAyatOfTheDay(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Center(child: syncproblem);
                          case ConnectionState.waiting:
                            return const Center(child: sync);
                          case ConnectionState.active:
                            return const Center(child: cpi);
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return const Center(child: signalWifiOff);
                            } else {
                              return Container(
                                margin: EdgeInsets.all(width * 0.04),
                                padding: EdgeInsets.all(width * 0.02),
                                decoration: BoxDecoration(
                                    color: wClr,
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: gClr.withAlpha(100),
                                        offset: const Offset(0, 6),
                                        blurRadius: 6,
                                        spreadRadius: 2,
                                      ),
                                    ]),
                                child: Column(
                                  children: [
                                    Text(
                                      "Ayat of the Day",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    const Divider(
                                      color: gClr,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, top: 2, bottom: 2),
                                      child: Text(
                                        snapshot.data!.arTxt!,
                                        style: theme.textTheme.headlineMedium,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <InlineSpan>[
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                snapshot.data!.surahNumber!
                                                    .toString(),
                                                style:
                                                    theme.textTheme.titleMedium,
                                              ),
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                snapshot.data!.surahName!,
                                                style:
                                                    theme.textTheme.titleMedium,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
