import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:kalamullah/widgets/general/animated_logo.dart';
import 'package:kalamullah/widgets/main_view/ayat_of_the_day_feature.dart';
import 'package:kalamullah/widgets/main_view/features_catalog/feature_catalog.dart';
import 'package:kalamullah/widgets/main_view/hijri_date.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wClr,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AnimatedLogo(
                widget: Image(image: logoRemoveBg, height: 130),
              ),
              const HijriDate(),
              Center(
                child: Column(
                  children: [
                    ayatOfTheDayFeature(),
                  ],
                ),
              ),
              const FeatureCatalog(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: gClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.chat,
          color: wClr,
        ),
      ),
    );
  }
}
