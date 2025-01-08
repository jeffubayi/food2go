// lib/services/farm_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/farm_model.dart';

class FarmService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Stream<List<Farm>> getFarms() {
    return _supabaseClient.from('farms').stream(primaryKey: ['id']).map(
        (data) => data.map((json) => Farm.fromJson(json)).toList());
  }

  Future<void> addFarm(Farm farm) async {
    await _supabaseClient.from('farms').insert({
      'farm_name': farm.name,
      'location': farm.location,
      'size': farm.size,
      'crop_type': farm.cropType,
      'soil_type': farm.soilType,
    });
  }

  Future<void> updateFarmData(String farmId, Map<String, dynamic> data) async {
    await _supabaseClient.from('farm_data').insert({
      'farm_id': farmId,
      ...data,
    });
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }
}
