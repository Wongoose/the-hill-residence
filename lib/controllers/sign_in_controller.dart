import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString errMessage = "".obs;
  RxBool isLoading = false.obs;

  bool get isEmpty => (emailController.text.isEmpty);
  bool get shortPassword => (passwordController.text.length < 6);
  bool get invalidEmail => (!emailController.text.contains("@"));
  bool get hasError => (errMessage.string.isNotEmpty);

  bool validateEmail() {
    if (isEmpty) {
      errMessage("Email cannot be empty");
    } else if (invalidEmail) {
      errMessage("Invalid email address");
    } else {
      //if pass all validations, return (true)
      return (true);
    }
    return (false);
  }

  bool validatePassword() {
    if (shortPassword) {
      errMessage("Password must have at least 6 characters");
    } else {
      return (true);
    }
    return (false);
  }

  Future<void> authEmailPassword({required bool isSignIn}) async {
    isLoading(true);
    FocusManager.instance.primaryFocus?.unfocus();

    await Future.delayed(Duration(seconds: 1));
    // Validate email and password input
    if (isSignIn) {
      // Sign in has email and password input
      if (!validateEmail() || !validatePassword()) {
        isLoading(false);
        return;
      }
    } else {
      // Sign up has no password input
      if (!validateEmail()) {
        isLoading(false);
        return;
      }
    }

    await Future.delayed(Duration(seconds: 1));
    if (isSignIn) {
      //firebase login
    } else {
      //verify email address
      navigateToCreateAccHome(emailController.text);
      // navigateToOpenInboxScreen(
      //     "We have sent a verification email to your inbox. Please follow the steps.");
    }
    isLoading(false);
  }
}
