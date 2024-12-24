import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:intl/intl.dart';
import 'package:kalamullah/widgets/general/animated_logo.dart';
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
      backgroundColor: wClr,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 24),
              child: AnimatedLogo(
                widget: FaIcon(FontAwesomeIcons.handsPraying,
                    color: gClr, size: 48),
              ),
            ),
            FutureBuilder(
              future: getLoc(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none ||
                    snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.connectionState == ConnectionState.active) {
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
                            Text("Fajar", style: g18b),
                            Text(
                              DateFormat.jm().format(prayerTimes.fajr),
                              style: g18b,
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
                            Text("Dhuhr", style: g18b),
                            Text(DateFormat.jm().format(prayerTimes.dhuhr),
                                style: g18b),
                          ],
                        ),
                      ),
                      Divider(color: gClr.withAlpha(100), thickness: 1),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Asr", style: g18b),
                            Text(
                              DateFormat.jm().format(prayerTimes.asr),
                              style: g18b,
                            ),
                          ],
                        ),
                      ),
                      Divider(color: gClr.withAlpha(100), thickness: 1),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Maghrib", style: g18b),
                            Text(
                              DateFormat.jm().format(prayerTimes.maghrib),
                              style: g18b,
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
                              style: g18b,
                            ),
                            Text(
                              DateFormat.jm().format(prayerTimes.isha),
                              style: g18b,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
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
