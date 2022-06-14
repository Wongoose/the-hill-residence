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

  bool validateEmailPassword() {
    if (isEmpty) {
      errMessage("Email cannot be empty");
    } else if (shortPassword) {
      errMessage("Password must have at least 6 characters");
    } else if (invalidEmail) {
      errMessage("Invalid email address");
    } else {
      //if pass all validations, return (true)
      return (true);
    }
    return (false);
  }

  Future<void> loginEmailPassword() async {
    isLoading(true);
    FocusManager.instance.primaryFocus?.unfocus();

    await Future.delayed(Duration(seconds: 1));
    //validate email and password input
    if (!validateEmailPassword()) {
      isLoading(false);
      return;
    }

    //verify email address

    //prompt open inbox screen
    await Future.delayed(Duration(seconds: 1));
    navigateToOpenInboxScreen(
        "We have sent a verification email to your inbox. Please follow the steps.");
    isLoading(false);
  }
}
