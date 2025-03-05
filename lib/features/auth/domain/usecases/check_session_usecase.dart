import 'package:qemana/core/usecases/usecase.dart';
import 'package:qemana/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:qemana/core/errors/failures.dart';

class CheckSessionUseCase implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  CheckSessionUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    try {
      final session = await repository.checkSession();
      return Right(session);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
