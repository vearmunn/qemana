import 'dart:io';
import 'package:qemana/core/errors/exceptions.dart';
import 'package:qemana/features/auth/domain/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;

class AuthRemoteDataSource {
  final sp.SupabaseClient supabase;

  AuthRemoteDataSource(this.supabase);

  Future<User> login(String email, String password) async {
    try {
      final response = await supabase.auth
          .signInWithPassword(email: email, password: password);

      if (response.user == null) {
        throw AuthException('Invalid credentials');
      }

      return User(
        id: response.user!.id,
        name: response.user?.userMetadata?['full_name'] ?? "User",
        email: response.user?.email ?? "",
      );
    } on sp.AuthException catch (e) {
      throw AuthException(e.message);
    } on SocketException {
      throw NetworkException('No internet connection');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<User> signUp(String email, String phone, String password) async {
    try {
      final response =
          await supabase.auth.signUp(email: email, password: password, data: {
        'full_name': 'User',
        'phone': phone,
      });

      if (response.user == null) {
        throw AuthException('Sign up failed');
      }

      return User(
        id: response.user!.id,
        name: response.user?.userMetadata?['full_name'] ?? "User",
        email: response.user?.email ?? "",
      );
    } on sp.AuthException catch (e) {
      throw AuthException(e.message);
    } on SocketException {
      throw NetworkException('No internet connection');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } on sp.AuthException catch (e) {
      throw AuthException(e.message);
    } on SocketException {
      throw NetworkException('No internet connection');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<bool> checkSession() async {
    try {
      final session = supabase.auth.currentSession;
      return session != null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
