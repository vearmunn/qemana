import 'package:flutter/material.dart';
import 'package:qemana/pages/auth/sign_in_page.dart';
import 'package:qemana/pages/auth/splash_screen.dart';
import 'package:qemana/pages/main_menu/primary_page.dart';
import 'package:qemana/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/supabase_secret.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: SupabaseSecret.supabaseUrl, anonKey: SupabaseSecret.anonKey);
  runApp(const MyApp());
}

final supabaseClient = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Flutter Qemana',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
            colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
            useMaterial3: false,
          ),
          home: const SplashScreen());
    });
  }
}
