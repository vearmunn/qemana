import 'package:dartz/dartz.dart';
import 'package:qemana/core/errors/failures.dart';
import 'package:qemana/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> signUp(
      String email, String phone, String password);
  Future<Either<Failure, void>> logout();
  Future<bool> checkSession();
}
