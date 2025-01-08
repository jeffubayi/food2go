import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> signUp({
    required String email,
    required String password,
    String? fullName,
  }) async {
    try {
       await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': fullName,
        },
      );
      // Handle response
    } catch (e) {
      throw e;
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      // Handle response
    } catch (e) {
      throw e;
    }
  }
}
