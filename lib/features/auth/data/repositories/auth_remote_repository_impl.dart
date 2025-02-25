import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:qemana/core/errors/failures.dart';
import 'package:qemana/core/errors/exceptions.dart';
import 'package:qemana/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:qemana/features/auth/domain/entities/user.dart';
import 'package:qemana/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final user = await remoteDataSource.login(email, password);
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(
      String email, String phone, String password) async {
    try {
      log('signUp $email $phone $password');
      final user = await remoteDataSource.signUp(email, phone, password);
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<bool> checkSession() async {
    try {
      return await remoteDataSource.checkSession();
    } on ServerException catch (e) {
      throw AuthException(e.message);
    }
  }
}
