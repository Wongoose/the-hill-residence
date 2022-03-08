import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/pages/vreg_share.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_registration_fab.dart";
import "package:the_hill_residence/widgets/textbox.dart";
import "package:the_hill_residence/widgets/vreg_center_display.dart";

class VRegDate extends StatelessWidget {
  const VRegDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyPageAppBar(
                leadingOnTap: () => Get.back(),
                title: "Visitor registration",
              ),
              Expanded(
                child: Container(),
              ),
              VRegCenterImageText(
                imagePath: "assets/images/calendar3.jpg",
                title: "Entry date",
                description: "When is your visitor's date of entry?",
              ),

              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: VRegTextField(hintText: "3rd March 2022"),
              ),

              Expanded(
                child: Container(),
              ),
              SizedBox(height: 50, width: 50),
              // Row - Next button
            ],
          ),
        ),
        floatingActionButton: MyRegFAB(
          onPressFunc: () => Get.to(() => VRegShare()),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
