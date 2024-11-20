import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/presentation/ui/home_page.dart';
import 'package:movie_app/src/presentation/ui/onboarding_page.dart';
import 'package:page_transition/page_transition.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        child: OnboardingPage(),
        fullscreenDialog: true,
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return PageTransition(
              type: PageTransitionType.fade,
              child: child,
              duration: const Duration(milliseconds: 1000),
              reverseDuration: const Duration(milliseconds: 1000),
            ).buildTransitions(context, animation, secondaryAnimation, child);
          },
        );
      },
    ),
    GoRoute(
        path: '/details/:movie',
        pageBuilder: (context, state) {
          final param = state.pathParameters['movie'];
          return const MaterialPage(
            child: HomePage(),
            fullscreenDialog: true,
          );
        }),
  ],
);
