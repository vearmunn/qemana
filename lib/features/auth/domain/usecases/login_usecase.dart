import 'package:dartz/dartz.dart';
import 'package:qemana/core/errors/failures.dart';
import 'package:qemana/core/usecases/usecase.dart';
import 'package:qemana/features/auth/domain/entities/user.dart';
import 'package:qemana/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) {
    return repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
