import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_registration_fab.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "package:the_hill_residence/widgets/textbox.dart";
import "package:the_hill_residence/widgets/vreg_center_display.dart";

class VRegContact extends StatelessWidget {
  const VRegContact({Key? key}) : super(key: key);

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
                      appBarType: MyAppBarType.back,
                    ),
                    SizedBox(height: 40),
                    Expanded(
                      child: Container(),
                    ),
                    VRegCenterImageText(
                      imagePath: "assets/images/visitor-info.png",
                      title: "Visitor info",
                      description: "Select a visitor from your contacts",
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
