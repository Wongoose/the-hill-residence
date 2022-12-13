import 'package:get/get.dart';
import 'package:the_hill_residence/models/model_user.dart';
import 'package:the_hill_residence/services/firebase/auth.dart';

class UserProfileController extends GetxController {
  // NEXT: Might consider merging class with CreateAccController
  final AuthService authService = Get.find();

  // Getters
  AppUser get appUser => authService.appUser;

  String? get fullName => authService.appUser.fullName;
  // Setter methods (udpate app user)
}
