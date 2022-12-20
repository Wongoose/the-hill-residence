import "package:get/get.dart";

class AppUser extends GetxController {
  // Auth identifiers
  final String? uid;
  final String? email;
  final String? provider;
  final bool isVerified;

  // Variables
  RxString fullName = "".obs;
  String? unitNum;
  String? road;
  String? city;
  String? postcode;

  bool get hasProfileDetails =>
      fullName.isNotEmpty && unitNum != null && road != null && city != null && postcode != null;

  AppUser({this.provider, this.email, this.uid, this.isVerified = false});
}
