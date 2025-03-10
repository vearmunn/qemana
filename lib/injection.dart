import 'package:get_it/get_it.dart';
import 'package:qemana/core/supabase_secret.dart';
import 'package:qemana/features/auth/data/repositories/auth_remote_repository_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/signup_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/check_session_usecase.dart';
import 'features/auth/presentation/blocs/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize Supabase
  await Supabase.initialize(
      url: SupabaseSecret.supabaseUrl, anonKey: SupabaseSecret.anonKey);

  // Register Supabase Client
  sl.registerLazySingleton(() => Supabase.instance.client);

  // Data Source
  sl.registerLazySingleton(() => AuthRemoteDataSource(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => CheckSessionUseCase(sl()));

  // Bloc
  sl.registerFactory(
    () => AuthCubit(
      loginUseCase: sl(),
      signUpUseCase: sl(),
      logoutUseCase: sl(),
      checkSessionUseCase: sl(),
    ),
  );
}
