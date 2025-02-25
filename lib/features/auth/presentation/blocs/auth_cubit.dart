import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qemana/core/usecases/usecase.dart';
import 'package:qemana/features/auth/domain/usecases/login_usecase.dart';
import 'package:qemana/features/auth/domain/usecases/signup_usecase.dart';
import 'package:qemana/features/auth/domain/usecases/logout_usecase.dart';
import 'package:qemana/features/auth/domain/usecases/check_session_usecase.dart';
import 'package:qemana/features/auth/presentation/blocs/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final LogoutUseCase logoutUseCase;
  final CheckSessionUseCase checkSessionUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.logoutUseCase,
    required this.checkSessionUseCase,
  }) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    final params = LoginParams(email: email, password: password);
    final result = await loginUseCase(params);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> signUp(String email, String phone, String password) async {
    emit(AuthLoading());

    final params = SignUpParams(
      email: email,
      phone: phone,
      password: password,
    );
    log("params: ${params.email}, ${params.phone}, ${params.password}");
    final result = await signUpUseCase(params);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());

    final result = await logoutUseCase(const NoParams());

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(LogoutSuccess()),
    );
  }

  Future<bool> checkSession() async {
    try {
      final result = await checkSessionUseCase(const NoParams());
      return result.fold(
        (failure) => false,
        (hasSession) => hasSession,
      );
    } catch (e) {
      return false;
    }
  }
}
