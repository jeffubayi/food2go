import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String url = 'https://wxmjetfdhskzyxwmqtqe.supabase.co';
  static const String anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind4bWpldGZkaHNrenl4d21xdHFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0NjIxMDYsImV4cCI6MjA0NDAzODEwNn0.wv17VxRE0DvKIdVvo6bkwGgIPRd03qFf_0Yj-8ABQvI';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );
  }
}
