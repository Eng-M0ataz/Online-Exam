import 'package:flutter/material.dart';
import 'package:online_exam/core/enums/transition_enum.dart';

PageRouteBuilder customRouteTransition({
  required Widget page,
  TransitionType type = TransitionType.fade,
  Duration duration = const Duration(seconds: 1),
}) {
  return PageRouteBuilder(
    transitionDuration: duration,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (type) {
        case TransitionType.fade:
          return FadeTransition(opacity: animation, child: child);

        case TransitionType.scale:
          return ScaleTransition(scale: animation, child: child);

        case TransitionType.slideFromRight:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );

        case TransitionType.slideFromLeft:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );

        case TransitionType.slideFromBottom:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );

        case TransitionType.none:
          return child;
      }
    },
  );
}
