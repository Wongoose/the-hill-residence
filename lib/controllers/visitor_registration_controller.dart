import "package:fluttercontactpicker/fluttercontactpicker.dart";
import "package:get/get.dart";

class VRegController extends GetxController {
  RxString visitorName = "".obs;
  RxString visitorPhone = "".obs;

  void selectNewContact() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    visitorName(contact.fullName);
    visitorPhone(contact.phoneNumber?.number);
    print("selectNewContact | name is: " + visitorName.string);
    print("selectNewContact | phone is: " + visitorPhone.string);
  }
}
