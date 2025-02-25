import 'package:dartz/dartz.dart';
import 'package:qemana/core/errors/failures.dart';
import 'package:qemana/core/usecases/usecase.dart';
import 'package:qemana/features/auth/domain/entities/user.dart';
import 'package:qemana/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<User, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(SignUpParams params) {
    return repository.signUp(params.email, params.phone, params.password);
  }
}

class SignUpParams {
  final String email;
  final String phone;
  final String password;

  SignUpParams({
    required this.email,
    required this.phone,
    required this.password,
  });
}
