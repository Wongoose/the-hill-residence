import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/pages/vreg_date.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_registration_fab.dart";
import "package:the_hill_residence/widgets/textbox.dart";
import "package:the_hill_residence/widgets/vreg_center_display.dart";

class VRegContact extends StatelessWidget {
  const VRegContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 22),
          child: Column(
            children: [
              MyPageAppBar(
                title: "Visitor registration",
              ),
              Expanded(
                child: Container(),
              ),
              VRegCenterImageText(
                imagePath: "assets/images/visitor-info.png",
                title: "Visitor info",
                description: "Select a visitor's phone from your contacts",
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: VRegTextField(hintText: "Phone"),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: VRegTextField(hintText: "Name"),
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
          navToWidget: VRegDate(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
