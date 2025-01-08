// lib/services/profile_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  final _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> getUserProfile() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return null;

      final response =
          await _supabase.from('profiles').select().eq('id', userId).single();

      return response;
    } catch (e) {
      print('Error fetching profile: $e');
      rethrow;
    }
  }

  Future<void> updateProfile({
    required String fullName,
    String? phone,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not found');

      await _supabase.from('profiles').upsert({
        'id': userId,
        'full_name': fullName,
        'phone': phone,
        // 'updated_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      print('Error updating profile: $e');
      rethrow;
    }
  }
}
