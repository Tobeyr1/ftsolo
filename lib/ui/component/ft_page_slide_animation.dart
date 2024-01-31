import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FtSoloPage<T> extends MaterialPage<T> {
  const FtSoloPage({required super.child});
}

class FtSoloSlidePage extends CustomTransitionPage {
  FtSoloSlidePage({
    required super.child,
    super.key,
  }) : super(
            reverseTransitionDuration: const Duration(milliseconds: 150),
            transitionDuration: const Duration(milliseconds: 150),
            transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
