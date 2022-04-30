// ignore_for_file: file_names

import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/screens/v-registration/widgets/vreg_center_display.dart";

class OpenInboxScreen extends StatelessWidget {
  final String description;

  const OpenInboxScreen({required this.description});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 32, 35, 22),
          child: Column(
            children: [
              MyPageAppBar(title: "Alert", appBarType: MyAppBarType.xmark),
              Expanded(child: Container()),
              VRegCenterImageText(
                imagePath: "assets/images/inbox.png",
                title: "Check your inbox",
                description: description,
              ),
              Expanded(child: Container()),
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () async {
                    // final OpenMailAppResult result =
                    //     await OpenMailApp.openMailApp();
                    // if (!result.didOpen && !result.canOpen) {
                    //   // If no mail apps found, show error
                    //   toast("Oops! No mail apps installed.");
                    // } else if (!result.didOpen && result.canOpen) {
                    //   showDialog(
                    //     context: context,
                    //     builder: (_) {
                    //       return MailAppPickerDialog(
                    //         mailApps: result.options,
                    //       );
                    //     },
                    //   );
                    // }
                  },
                  child: Text(
                    "Open email app",
                    style: TextStyle(
                      // shadows: [
                      //   Shadow(
                      //       color: Colors.black26,
                      //       blurRadius: 10,
                      //       offset: Offset(0.5, 0.5))
                      // ],
                      fontFamily: "Nunito",
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    "Click to go back to home",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        decoration: TextDecoration.underline,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
