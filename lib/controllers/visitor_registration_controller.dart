import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';

class VRegGetController extends GetxController {
  RxString visitor_name = "".obs;
  RxString visitor_phone = "".obs;

  void selectNewContact() async {
    final PhoneContact _contact = await FlutterContactPicker.pickPhoneContact();
    visitor_name(_contact.fullName);
    visitor_phone(_contact.phoneNumber?.number);
  }
}
