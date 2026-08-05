import 'package:flutter/material.dart';
import 'package:task_1/auth/auth.dart';

class SplashScreen extends StatefulWidget {
  final AuthNotifier authNotifier;
  const SplashScreen({super.key, required this.authNotifier});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // إكمال التهيئة وتجاوز الشاشة الأولى/الـ Onboarding عند جاهزية التطبيق
    _initApp();
  }

  Future<void> _initApp() async {
    await Future.delayed(const Duration(seconds: 2));
    widget.authNotifier.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.checklist_rtl_rounded,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              const Text(
                'ToDo',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 48),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // إعلام الحالة بأن المستخدم أتم الإعداد وحان وقت الانتقال لتسجيل الدخول
                    widget.authNotifier.onboarding();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: Colors.white),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}