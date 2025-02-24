import 'package:flutter/material.dart';
import 'package:qemana/pages/main_menu/primary_page.dart';

import '../../main.dart';
import 'sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _redirect() async {
    // await Future.delayed(Duration.zero);
    // final currentSession = supabaseClient.auth.currentSession;

    // if (!mounted) return;

    // if (currentSession == null) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (_) => const SignInPage()));
    // } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const PrimaryPage()));
    // }
  }

  @override
  void initState() {
    _redirect();
    super.initState();
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
