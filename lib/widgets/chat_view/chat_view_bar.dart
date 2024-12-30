  import 'package:flutter/material.dart';
  import 'package:kalamullah/consts/constants.dart';

  class ChatViewBar extends StatefulWidget {
    const ChatViewBar({super.key});

    @override
    State<ChatViewBar> createState() => _ChatViewBarState();
  }

  class _ChatViewBarState extends State<ChatViewBar>
      with SingleTickerProviderStateMixin {
    late AnimationController _animationController;
    late Animation<Offset> _slideAnimation;

    @override
    void initState() {
      _animationController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      )..repeat(reverse: true);

      _slideAnimation =
          Tween<Offset>(begin: Offset.zero, end: const Offset(0, 0.2)).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
      );
      super.initState();
    }

    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return SlideTransition(
            position: _slideAnimation,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 18, right: 18, top: 4, bottom: 4),
              decoration: BoxDecoration(
                color: wClr,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [shadowBox],
              ),
              child: Text('Kalamullah AI', style: g18),
            ),
          );
        },
      );
    }
  }
