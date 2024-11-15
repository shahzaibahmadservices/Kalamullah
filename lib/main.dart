import 'package:flutter/material.dart';
import 'package:kalamullah/constants/constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kalamullah/widgets/surah_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kalamullah/views/home_screen.dart';
import 'package:kalamullah/views/onboardings/onboardings.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
  runApp(MyApp(
    hasSeenOnboarding: hasSeenOnboarding,
  ));
}

class MyApp extends StatefulWidget {
  final bool hasSeenOnboarding;

  const MyApp({super.key, required this.hasSeenOnboarding});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    splashInitialization();
  }

  void splashInitialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalamullah',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: {
        SurahDetail.id: (context) => SurahDetail(),
      },
      home: widget.hasSeenOnboarding ? const HomeScreen() : const OnBoarding(),
    );
  }
}
