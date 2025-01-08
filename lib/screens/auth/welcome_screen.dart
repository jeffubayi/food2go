// lib/screens/auth/welcome_screen.dart
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/app_icon.png', // Make sure to add this to assets
                height: 130,
              ),
              const SizedBox(height: 16),
              // App Name
              const Text(
                'Foodgo',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              // const Spacer(),
              const SizedBox(height:10),
              const Text(
                'Your home of fresh grocery at your fingertips',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textGrey,
                ),
              ),
              // const Spacer(),
              const SizedBox(height: 30),
              // Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Or divider
              // Row(
              //   children: [
              //     Expanded(
              //       child: Divider(color: Colors.grey[300], thickness: 1),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 16),
              //       child: Text(
              //         'Or',
              //         style: TextStyle(
              //           color: Colors.grey[600],
              //           fontSize: 14,
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Divider(color: Colors.grey[300], thickness: 1),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 24),
              // // Social Login Buttons
              // _socialLoginButton(
              //   'Continue with Google',
              //   'assets/icons/google.png',
              //   () {
              //     // Implement Google sign in
              //   },
              // ),
              // const SizedBox(height: 16),
              // _socialLoginButton(
              //   'Continue with Facebook',
              //   'assets/icons/facebook.png',
              //   () {
              //     // Implement Facebook sign in
              //   },
              //   isFacebook: true,
              // ),
              // const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButton(
    String text,
    String iconPath,
    VoidCallback onPressed, {
    bool isFacebook = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.grey[300]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isFacebook ? Icons.facebook : Icons.g_mobiledata,
              color: isFacebook ? Colors.blue : Colors.red,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
