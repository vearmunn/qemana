import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _redirect() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Add a delay for splash screen
    // final currentSession = supabaseClient.auth.currentSession;

    if (!mounted) return;

    // if (currentSession == null) {
    //   context.go('/signin');
    // } else {
    context.go('/primary');
    // }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _redirect();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
