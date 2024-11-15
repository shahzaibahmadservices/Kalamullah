class AyatOfTheDay {
  final String? arTxt;
  final String? enTrans;
  final String? surahName;
  final int? surahNumber;

  AyatOfTheDay({
    required this.arTxt,
    required this.enTrans,
    required this.surahName,
    required this.surahNumber,
  });

  factory AyatOfTheDay.fromJson(Map<String, dynamic> json) {
    return AyatOfTheDay(
      arTxt: json['data'][0]['text'],
      enTrans: json['data'][2]['text'],
      surahName: json['data'][2]['surah']['englishName'],
      surahNumber: json['data'][2]['numberInSurah'],
    );
  }
}
