import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/visitor_registration_controller.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_registration_fab.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "package:the_hill_residence/widgets/textbox.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";

class VRegContact extends StatelessWidget {
  final VRegGetController _vRegGetController = Get.put(VRegGetController());
  VRegContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 32, 22, 22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyPageAppBar(
                      title: "Visitor registration",
                      appBarType: MyAppBarType.xmark,
                    ),
                    SizedBox(height: 40),
                    Expanded(
                      child: Container(),
                    ),
                    VRegCenterImageText(
                      imagePath: "assets/images/visitor-info.png",
                      title: "Visitor info",
                      description: "How do we identify your visitor?",
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: VRegTextField(
                        hintText: "Visitor's phone number",
                        icon: FontAwesomeIcons.phoneAlt,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: VRegTextField(
                        hintText: "Visitor's name",
                        icon: FontAwesomeIcons.userAlt,
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        _vRegGetController.selectNewContact();
                      },
                      child: Text(
                        "Select from my contacts",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(),
                    ),
                    SizedBox(height: 100, width: 50),
                    // Row - Next button
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: MyRegFAB(
          onPressed: navigateToVRegDate,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
