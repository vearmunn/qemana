import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:qemana/core/usecases/usecase.dart';
import 'package:qemana/features/auth/domain/usecases/logout_usecase.dart';

import '../../core/utils/loading_circle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void logoutUser() async {
    loadingCircle(context);

    final logoutUseCase = GetIt.I<LogoutUseCase>();
    final result = await logoutUseCase(const NoParams());

    if (!mounted) return;
    Navigator.pop(context); // Remove loading circle

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Failed to logout'),
          ),
        );
      },
      (_) {
        context.go('/signin');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: logoutUser, child: const Text('Sign Out')),
      ),
    );
  }
}
