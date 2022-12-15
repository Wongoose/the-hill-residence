import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:the_hill_residence/controllers/user_details_controller.dart';
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/auth/widgets/auth_richtext.dart";
import "package:the_hill_residence/screens/create_account/widgets/textfield_full_address.dart";
import "package:the_hill_residence/screens/create_account/widgets/textfield_unit_address.dart";
import "package:the_hill_residence/shared/all_loading.dart";
import "package:the_hill_residence/shared/my_expanded_btn.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class CreateAccAddress extends StatelessWidget {
  const CreateAccAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.find();
    final UserDetailsController createAccController = Get.find();
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
                  child: Column(children: [
                    MyPageAppBar(title: "Create account", appBarType: MyAppBarType.back),
                    // Expanded(child: Container()),
                    SizedBox(height: 40),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: AuthRichText(
                          coloredText: "Resident address",
                          text: "",
                        )),
                    SizedBox(height: 20),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          "Please provide your residential address.",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              color: themeService.textColor54,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        )),
                    SizedBox(height: 25),
                    Form(
                      key: createAccController.addressKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(children: [
                        // NEXT: Change address input (Street address and city, house/unit #, postcode)
                        TextFieldFullAddress(textController: createAccController.addressController),
                        SizedBox(height: 20),
                        TextFieldUnitAddress(textController: createAccController.unitNumController),
                      ]),
                    ),
                  ])),
              Expanded(child: Container()),
              Obx(() => createAccController.isLoading.isTrue
                  ? CircleLoading(size: 1.5)
                  : MyExpandedButton(
                      text: "Save and continue",
                      // NEXT - validate, then update firestore profile details
                      // NEXT - refresh authState to authWrapper
                      onPressFunc: () {
                        if (createAccController.validateAddress) {
                          createAccController.submitCreateAccDetails();
                        }
                      })),
            ]),
          ),
        ],
      )),
    );
  }
}
