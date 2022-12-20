import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/screens/create_account/widgets/textfield_city.dart";
import "package:the_hill_residence/screens/create_account/widgets/textfield_postcode.dart";
import "package:the_hill_residence/screens/create_account/widgets/textfield_road.dart";
import "package:the_hill_residence/screens/create_account/widgets/textfield_unit_address.dart";
import "package:the_hill_residence/shared/all_loading.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class EditAddressPage extends StatelessWidget {
  const EditAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.find();
    userDetailsController.unitNumController.text = userDetailsController.unitNum ?? "";
    userDetailsController.roadController.text = userDetailsController.road ?? "";
    userDetailsController.cityController.text = userDetailsController.city ?? "";
    userDetailsController.postcodeController.text = userDetailsController.postcode ?? "";
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyPageAppBar(title: "Edit profile", appBarType: MyAppBarType.back),
                // Expanded(child: Container()),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: Text(
                    "Your address",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Form(
                    key: userDetailsController.addressKey,
                    onChanged: () => userDetailsController.updateEditChanges(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFieldUnitAddress(textController: userDetailsController.unitNumController),
                        SizedBox(height: 20),
                        TextFieldRoadAddress(textController: userDetailsController.roadController),
                        SizedBox(height: 20),
                        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Expanded(
                              flex: 1,
                              child: TextFieldCityAddress(textController: userDetailsController.cityController)),
                          SizedBox(width: 15),
                          Expanded(
                              flex: 1,
                              child: TextFieldPostcode(textController: userDetailsController.postcodeController)),
                        ]),
                      ],
                    )),
              ],
            ),
          ),
          Expanded(child: Container()),
          Obx(() {
            userDetailsController.updateEditChanges();
            return userDetailsController.isLoading.isTrue
                ? CircleLoading(size: 1.5)
                : MyExpandedButton(
                    text: "Save changes",
                    color: userDetailsController.addressHasChanges.value ? null : Colors.grey[400],
                    onPressFunc: () => userDetailsController.updateAddressDetails());
          }),
        ],
      )),
    );
  }
}
