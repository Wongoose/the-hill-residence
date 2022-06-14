import "package:fluttercontactpicker/fluttercontactpicker.dart";
import "package:get/get.dart";

class VRegGetController extends GetxController {
  RxString visitorName = "".obs;
  RxString visitorPhone = "".obs;

  void selectNewContact() async {
    final PhoneContact _contact = await FlutterContactPicker.pickPhoneContact();
    visitorName(_contact.fullName);
    visitorPhone(_contact.phoneNumber?.number);
  }
}
