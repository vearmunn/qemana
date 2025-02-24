// Repository Interface (auth_repository.dart)
import 'package:qemana/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
}
