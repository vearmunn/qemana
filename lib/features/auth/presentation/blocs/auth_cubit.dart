import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qemana/features/auth/domain/entities/user.dart';
import 'package:qemana/features/auth/domain/usecases/login_usecase.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;

  AuthCubit(this.loginUseCase) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase(email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure("Login failed"));
    }
  }

  void logout() {
    emit(AuthInitial()); // Reset state
  }
}
