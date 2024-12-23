import 'package:flutter/material.dart';
import 'package:kalamullah/constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:adhan/adhan.dart';

class PrayersView extends StatefulWidget {
  const PrayersView({super.key});

  @override
  State<PrayersView> createState() => _PrayersViewState();
}

class _PrayersViewState extends State<PrayersView> {
  Location location = Location();
  LocationData? _currentPosition;
  double? latitude, longitude;
  final Madhab _selectedMadhab = Madhab.shafi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Prayer Times",
          style: theme.textTheme.headlineSmall,
        ),
      ),
      body: FutureBuilder(
        future: getLoc(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: cpi,
            );
          }
          final myCoordinates = Coordinates(33.7699333, 72.8248431);
          final params = CalculationMethod.karachi.getParameters();
          params.madhab = _selectedMadhab;
          final prayerTimes = PrayerTimes.today(myCoordinates, params);
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fajar",
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        DateFormat.jm().format(prayerTimes.fajr),
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: gClr.withAlpha(100),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dhuhr",
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        DateFormat.jm().format(prayerTimes.dhuhr),
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: gClr.withAlpha(100),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Asr",
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        DateFormat.jm().format(prayerTimes.asr),
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: gClr.withAlpha(100),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Maghrib",
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        DateFormat.jm().format(prayerTimes.maghrib),
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: gClr.withAlpha(100),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Isha",
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        DateFormat.jm().format(prayerTimes.isha),
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  getLoc() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _currentPosition = await location.getLocation();
    latitude = _currentPosition!.latitude;
    longitude = _currentPosition!.longitude;
  }
}
