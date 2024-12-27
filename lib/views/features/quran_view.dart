import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:kalamullah/services/quran_api_services.dart';
import 'package:kalamullah/models/surah.dart';
import 'package:kalamullah/consts/surah_index.dart';
import 'package:kalamullah/widgets/quran_view/surah_listtile.dart';
import 'package:kalamullah/widgets/quran_view/surah_detail.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  QuranAPIServices quranAPIServices = QuranAPIServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: quranAPIServices.getSurah(),
          builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
            if (snapshot.hasData) {
              List<Surah>? surah = snapshot.data;
              return ListView.builder(
                itemCount: surah!.length,
                itemBuilder: (context, index) => surahListTile(
                  surah: surah[index],
                  context: context,
                  onTap: () {
                    setState(() {
                      Indexes.surahIndex = (index + 1);
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
    );
  }
}
