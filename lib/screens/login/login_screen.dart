import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.pets_rounded, color: AppColors.primary, size: 64),
                  const SizedBox(height: 24),
                  const Text(
                    'Selamat Datang di PetCare',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textDark),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Masuk untuk mulai merawat hewan peliharaanmu',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: AppColors.textGrey),
                  ),
                  const SizedBox(height: 40),
                  const TextField(decoration: InputDecoration(hintText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
                  const SizedBox(height: 16),
                  const TextField(obscureText: true, decoration: InputDecoration(hintText: 'Password', prefixIcon: Icon(Icons.lock_outline))),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
                    child: const Text('Masuk sebagai Tamu'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}