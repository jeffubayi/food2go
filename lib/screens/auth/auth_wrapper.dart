// lib/screens/auth/auth_wrapper.dart
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:supbase_app/screens/auth/login_screen.dart';
// import 'package:supbase_app/screens/dashboard/dashboard_screen.dart';

// class AuthWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<AuthState>(
//       stream: Supabase.instance.client.auth.onAuthStateChange,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final session = snapshot.data?.session;
//           if (session != null) {
//             return MainContainerScreen();
//           }
//         }
//         return LoginScreen();
//       },
//     );
//   }
// }

// lib/screens/auth/auth_wrapper.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../main/main_container_screen.dart';
import 'login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final session = snapshot.data?.session;
          if (session != null) {
            return const MainContainerScreen();
          }
        }
        return const LoginScreen();
      },
    );
  }
}
