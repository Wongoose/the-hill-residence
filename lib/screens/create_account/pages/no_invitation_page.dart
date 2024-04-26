import "package:flutter/material.dart";
import "package:flutter_email_sender/flutter_email_sender.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";

class NoInvitationPage extends StatelessWidget {
  final String? email;
  final String? fullName;

  const NoInvitationPage({
    this.email,
    this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.put(UserDetailsController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 32, 35, 22),
          child: Column(
            children: [
              MyPageAppBar(title: "Create account", appBarType: MyAppBarType.xmark),
              Expanded(child: Container()),
              VRegCenterImageText(
                imagePath: "assets/images/reminder.png",
                title: "No invitation",
                description:
                    "No unit available under $email. If you think there's a mistake, please contact your administrator.",
              ),
              Expanded(child: Container()),
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () async {
                    final Email sendEmail = Email(
                      recipients: ["thehillpenang@gmail.com"],
                      subject: "The-Hill Residence: New unit request",
                      body: "Dear Admin,\n\nMy unit details: _insert unit address here_\nOwner's name: _insert your name here_\n\nYours sincerely,\n$fullName"
                    );

                    await FlutterEmailSender.send(sendEmail);
                  },
                  child: Text(
                    "Contact administrator",
                    style: TextStyle(
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
                onTap: () => userDetailsController.continueAsGuest(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    "Or continue as guest",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).colorScheme.secondary,
                        color: Theme.of(context).colorScheme.secondary,
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
