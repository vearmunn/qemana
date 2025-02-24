import 'package:qemana/features/auth/domain/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;

class AuthRemoteDataSource {
  final sp.SupabaseClient supabase;

  AuthRemoteDataSource(this.supabase);

  Future<User> login(String email, String password) async {
    final response = await supabase.auth
        .signInWithPassword(email: email, password: password);

    if (response.user == null) {
      throw Exception("Login failed");
    }

    return User(
      id: response.user!.id,
      name: response.user!.userMetadata?['full_name'] ?? "User",
      email: response.user!.email ?? "",
    );
  }
}
