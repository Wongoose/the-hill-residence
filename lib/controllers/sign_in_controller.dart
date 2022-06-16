import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString errMessage = "".obs;
  RxBool isLoading = false.obs;
  bool firstValidation = true;

  bool get isEmpty => (emailController.text.isEmpty);
  bool get shortPassword => (passwordController.text.length < 6);
  bool get invalidEmail => (!emailController.text.contains("@"));
  bool get hasError => (errMessage.string.isNotEmpty);

  bool validateEmail({bool only = false}) {
    if (isEmpty) {
      errMessage("Email cannot be empty");
    } else if (invalidEmail) {
      errMessage("Invalid email address");
    } else {
      //if pass all validations, return (true)
      only ? errMessage("") : null;
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

  bool validateEmailAndPassword() {
    if (validateEmail() && validatePassword()) {
      errMessage("");
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
      if (!validateEmailAndPassword()) {
        firstValidation = false;
        isLoading(false);
        return;
      }
    } else {
      // Sign up has no password input
      if (!validateEmail()) {
        firstValidation = false;
        isLoading(false);
        return;
      }
    }

    await Future.delayed(Duration(seconds: 1));
    if (isSignIn) {
      //firebase login
      navigateOffAllHome();
    } else {
      //verify email address
      navigateToCreateAccHome(emailController.text);
      // navigateToOpenInboxScreen(
      //     "We have sent a verification email to your inbox. Please follow the steps.");
    }
    isLoading(false);
  }
}
