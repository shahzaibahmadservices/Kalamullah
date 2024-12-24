import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:hijri/hijri_calendar.dart';

class HijriDate extends StatelessWidget {
  const HijriDate({super.key});

  @override
  Widget build(BuildContext context) {
    HijriCalendar hijriDate = HijriCalendar.now();
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(hijriDate.hDay.toString(), style: g16b),
          const SizedBox(width: 5),
          Text(hijriDate.longMonthName, style: g16b),
          const SizedBox(width: 5),
          Text(hijriDate.hYear.toString(), style: g16b),
        ],
      ),
    );
  }
}
