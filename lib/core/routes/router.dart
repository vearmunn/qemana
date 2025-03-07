import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qemana/features/auth/presentation/pages/onboard_page.dart';
import 'package:qemana/features/auth/presentation/pages/register_page.dart';
import 'package:qemana/features/auth/presentation/pages/sign_in_page.dart';
import 'package:qemana/features/auth/presentation/pages/splash_screen.dart';
import 'package:qemana/features/main_menu/presentation/pages/primary_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/onboard',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardPage();
      },
    ),
    GoRoute(
      path: '/signin',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInPage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: '/primary',
      builder: (BuildContext context, GoRouterState state) {
        return const PrimaryPage();
      },
    ),
    // Add more routes here as needed
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
);
