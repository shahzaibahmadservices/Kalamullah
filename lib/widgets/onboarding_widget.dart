import 'package:flutter/material.dart';
import 'package:kalamullah/constants/constants.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String description;
  final AssetImage imageAsset;

  const OnboardingWidget({
    required this.title,
    required this.description,
    required this.imageAsset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.4,
          width: width * 0.8,
          child: Image(
            image: imageAsset,
          ),
        ),
        SizedBox(height: height * 0.04),
        Text(
          title,
          style: theme.textTheme.headlineMedium,
        ),
        SizedBox(height: height * 0.01),
        Text(
          description,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
