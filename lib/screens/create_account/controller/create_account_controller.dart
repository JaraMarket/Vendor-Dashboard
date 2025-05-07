import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jara_market/data/apiClient/apiClient.dart';

class CreateAccountController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 void processSignUp() {
    // Implement your sign-up logic here
    // For example, you can call an API to create a new account
    // and handle the response accordingly.
    apiClient.onboarding_signup(
      emailController.text,
      passwordController.text,
    );
  }

  void validateEmail(String email) {
    // Implement your email validation logic here
    // For example, you can use a regex pattern to check if the email is valid.
  }

  void validatePassword(String password) {
    // Implement your password validation logic here
    // For example, you can check if the password meets certain criteria.
  } 
}