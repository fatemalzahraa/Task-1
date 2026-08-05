import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/auth/auth.dart';
import 'package:task_1/screens/error_screen.dart';
import 'package:task_1/screens/home_screen.dart';
import 'package:task_1/screens/login_screen.dart';
import 'package:task_1/screens/onboarding_screen.dart';
import 'package:task_1/screens/profile_screen.dart';
import 'package:task_1/screens/splash_screen.dart';

class AppRouter {
  final AuthNotifier authNotifier;
  final GoRouter router;

  AppRouter(this.authNotifier)
      : router = GoRouter(
          initialLocation: '/splash',
          refreshListenable: authNotifier,
          routes: [
            GoRoute(
              path: '/splash',
              // تمرير authNotifier إلى SplashScreen
              builder: (context, state) => SplashScreen(authNotifier: authNotifier),
            ),
            GoRoute(
  path: '/onboarding',
  builder: (context, state) => OnboardingScreen(authNotifier: authNotifier),
),
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'profile/:name',
                  builder: (context, state) =>
                      ProfileScreen(name: state.pathParameters['name']!),
                ),
              ],
            ),
            GoRoute(
              path: '/login',
              builder: (context, state) => LoginScreen(authNotifier: authNotifier),
            ),
          ],
          redirect: (BuildContext context, GoRouterState state) {
            final isLoggedIn = authNotifier.isLoggedIn;
            final isInitialized = authNotifier.isInitialized;
            final isFirstTime = authNotifier.isFirstTime;
            final currentPath = state.matchedLocation;

            // 1. إذا لم تكتمل التهيئة بعد، ابقَ في Splash
            if (!isInitialized) {
              return currentPath == '/splash' ? null : '/splash';
            }

            final isGoingToSplash = currentPath == '/splash';
            final isGoingToOnboarding = currentPath == '/onboarding';
            final isGoingToLogin = currentPath == '/login';

            // 2. إذا كانت المرة الأولى، وجهه إلى Onboarding
            if (isFirstTime) {
              return isGoingToOnboarding ? null : '/onboarding';
            }

            // 3. إذا لم يكن مسجلاً للدخول، وجهه إلى Login
            if (!isLoggedIn) {
              return isGoingToLogin ? null : '/login';
            }

            // 4. إذا كان مسجلاً للدخول حاول الوصول لصفحة دخول أو سبلاش أو أونبوردينغ
            if (isLoggedIn &&
                (isGoingToLogin || isGoingToSplash || isGoingToOnboarding)) {
              return '/home';
            }

            return null;
          },
          errorBuilder: (context, state) => ErrorScreen(error: state.error),
        );
}