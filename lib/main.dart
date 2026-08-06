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
    _appRouter = AppRouter(_authNotifier);

  
  }

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.router,
    );
  }
}