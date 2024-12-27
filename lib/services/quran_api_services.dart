import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kalamullah/models/surah.dart';
import 'package:kalamullah/models/ayat_of_the_day.dart';
import 'package:kalamullah/models/surah_translation.dart';
import 'dart:convert';
import 'dart:math';

class QuranAPIServices {
  final endPointUrl = 'https://api.alquran.cloud/v1/surah';
  List<Surah> list = [];
  Future<List<Surah>> getSurah() async {
    Response response = await http.get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      return list;
    } else {
      throw ("Can not get the Surah");
    }
  }

  Future<AyatOfTheDay> getAyatOfTheDay() async {
    String url =
        "https://api.alquran.cloud/v1/ayah/${random(1, 6236)}/editions/quran-uthmani,en.asad,en.pickthall ";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return AyatOfTheDay.fromJson(json.decode(response.body));
    } else {
      throw Exception("Something went wrong");
    }
  }

  random(min, max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

  Future<SurahTranslationList> getSurahTranslation(int index) async {
    final url =
        "https://quranenc.com/api/translation/sura/urdu_junagarhi/$index";
    var response = await http.get(Uri.parse(url));
    return SurahTranslationList.fromJson(json.decode(response.body));
  }
}
