import 'package:get/get.dart';
import 'package:the_hill_residence/models/model_user.dart';
import 'package:the_hill_residence/services/firebase/auth.dart';

class UserProfileController extends GetxController {
  final AuthService authService = Get.find();

  // Getters
  AppUser get appUser => authService.appUser;

  String? get firstName => authService.appUser.firstName;
  String? get lastName => authService.appUser.lastName;
  String? get displayName => "$firstName $lastName";

  // Setter methods (udpate app user)
}
