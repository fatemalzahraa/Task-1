import 'package:flutter/material.dart';
import 'package:task_1/auth/auth.dart';

class OnboardingScreen extends StatelessWidget {
  final AuthNotifier authNotifier;

  const OnboardingScreen({super.key, required this.authNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Onboarding Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // تحديث الحالة بأن Onboarding انتهت بدلاً من التوجيه اليدوي
                authNotifier.onboarding();
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}