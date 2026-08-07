import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier {
  bool isInitialized = false;
  bool isLoggedIn = true;
  bool isFirstTime = true;

  void login() {
    isLoggedIn = true;
    notifyListeners();
  }

  void onboarding(){
    isFirstTime = false;
    notifyListeners();
  }

  void initialize() {
    isInitialized = true;
    notifyListeners();
  }
  void logout() {
  isLoggedIn = false;
  notifyListeners();
}

}


