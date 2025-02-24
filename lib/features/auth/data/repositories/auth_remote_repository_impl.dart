import 'package:qemana/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:qemana/features/auth/domain/entities/user.dart';
import 'package:qemana/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
