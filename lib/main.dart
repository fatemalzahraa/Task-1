import 'package:flutter/material.dart';
import 'package:task_1/auth/auth.dart';
import 'package:task_1/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 1. إنشاء كائن AuthNotifier مرة واحدة فقط
  late final AuthNotifier _authNotifier;
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _authNotifier = AuthNotifier();

    // 2. تمرير _authNotifier إلى AppRouter لحل خطأ Positional Argument
    _appRouter = AppRouter(_authNotifier);

    // 3. تشغيل دالة التهيئة المبدئية للتطبيق (Splash)
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // محاكاة تحميل البيانات قبل إخفاء Splash
    await Future.delayed(const Duration(seconds: 2));
    _authNotifier.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.router,
    );
  }
}