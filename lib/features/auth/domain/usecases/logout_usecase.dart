import 'package:dartz/dartz.dart';
import 'package:qemana/core/errors/failures.dart';
import 'package:qemana/core/usecases/usecase.dart';
import 'package:qemana/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logout();
  }
}
