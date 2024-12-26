import 'dart:core';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

  bool isLoading = false;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;
  bool isPasswordVisible = false;

  bool togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
    return isPasswordVisible;
  }

  void validateEmail(String email) {
    email = email.trim();
    if (email.isEmpty) {
      emailError = 'Email cannot be empty';
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
      emailError = 'Invalid email format';
    } else {
      emailError = null;
    }
    notifyListeners();
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      passwordError = 'Password cannot be empty';
    } else if (password.length < 6) {
      passwordError = 'Password must be at least 6 characters';
    } else {
      passwordError = null;
    }
    notifyListeners();
  }

  void validateConfirmPassword(String confirmPassword) {
    if (confirmPassword.isEmpty) {
      confirmPasswordError = 'Confirm Password cannot be empty';
    } else if (confirmPassword.length < 6) {
      confirmPasswordError = 'Confirm Password must be at least 6 characters';
    } else {
      confirmPasswordError = null;
    }
    notifyListeners();
  }
}





