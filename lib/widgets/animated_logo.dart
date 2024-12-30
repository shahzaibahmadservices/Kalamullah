import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  final Widget widget;
  const AnimatedLogo({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, double scale, child) {
        return Transform.scale(scale: scale, child: widget);
      },
    );
  }
}
