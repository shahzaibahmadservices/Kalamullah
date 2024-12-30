import 'package:flutter/material.dart';

void navigationWidget(BuildContext context, Widget view) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: view,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return Transition(child: child);
      },
    ),
  );
}

class Transition extends StatelessWidget {
  final Widget child;

  const Transition({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: child,
    );
  }
}
