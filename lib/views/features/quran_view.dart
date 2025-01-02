import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:kalamullah/services/quran_api_services.dart';
import 'package:kalamullah/models/surah.dart';
import 'package:kalamullah/consts/surah_index.dart';
import 'package:kalamullah/widgets/quran_view/surah_listtile.dart';
import 'package:kalamullah/widgets/quran_view/surah_detail.dart';
import 'package:kalamullah/widgets/quran_view/search_bar.dart' as search_bar;

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  QuranAPIServices quranAPIServices = QuranAPIServices();
  TextEditingController searchController = TextEditingController();
  List<Surah>? surahList;
  List<Surah>? filteredSurahList;

  @override
  void initState() {
    super.initState();
    quranAPIServices.getSurah().then((surah) {
      setState(() {
        surahList = surah;
        filteredSurahList = surah;
      });
    });
  }

  void filterSurahs(String query) {
    setState(() {
      filteredSurahList = surahList!
          .where((surah) =>
              surah.englishName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wClr,
      body: SafeArea(
        child: Column(
          children: [
            search_bar.SearchBar(
              controller: searchController,
              onChanged: filterSurahs,
            ),
            Expanded(
              child: FutureBuilder(
                future: quranAPIServices.getSurah(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Surah>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.none ||
                      snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.active) {
                    return const Center(
                      child: progressIndicator,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "An error occurred,\nPlease check your internet connection !!",
                        style: g16,
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: filteredSurahList!.length,
                      itemBuilder: (context, index) => surahListTile(
                        surah: filteredSurahList![index],
                        context: context,
                        onTap: () {
                          setState(() {
                            Indexes.surahIndex =
                                surahList!.indexOf(filteredSurahList![index]) +
                                    1;
                          });
                          Navigator.pushNamed(context, SurahDetail.id);
                        },
                      ),
                    );
                  }
                  return const Center(
                    child: progressIndicator,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
