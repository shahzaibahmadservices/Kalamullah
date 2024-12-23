import 'package:flutter/material.dart';
import 'package:kalamullah/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kalamullah/widgets/onboarding_widget.dart';
import 'package:kalamullah/views/home_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  final List<OnboardingWidget> onboardingScreens = [
    const OnboardingWidget(
      title: 'Your Digital Quran',
      description: 'Immerse yourself in the sacred words\n of the Holy Quran',
      imageAsset: onboarding01,
    ),
    const OnboardingWidget(
      title: 'Explore and Learn',
      description: 'Discover new translations, recitations,\n and commentaries',
      imageAsset: onboarding02,
    ),
    const OnboardingWidget(
      title: 'Get Started',
      description: 'Customize your app to suit your\n preferences and needs',
      imageAsset: onboarding03,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          itemCount: onboardingScreens.length,
          itemBuilder: (context, index) => onboardingScreens[index],
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.only(left: width * 0.05, right: height * 0.02),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  onboardingScreens.length,
                  (index) => onboardingDots(index, width, height),
                ),
                SizedBox(
                  width: width * 0.1,
                ),
                IconButton(
                  onPressed: () async {
                    if (currentIndex < onboardingScreens.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    } else {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('hasSeenOnboarding', true);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    }
                  },
                  icon: currentIndex == onboardingScreens.length - 1
                      ? Text(
                          "Get Started",
                          style: theme.textTheme.titleMedium,
                        )
                      : const Icon(
                          Icons.arrow_forward,
                          color: gClr,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget onboardingDots(int index, double sizeWidth, sizeHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.01),
      child: Container(
        width: sizeWidth * 0.02,
        height: sizeHeight * 0.02,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? gClr : Colors.black12),
      ),
    );
  }
}
