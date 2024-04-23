import "package:flutter/material.dart";
import "package:flutter_email_sender/flutter_email_sender.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class SendInvitationPage extends StatelessWidget {
  final String description;
  final VoidCallback? initFunction;
  final VoidCallback? completeFunction;
  final String? completedMessage;
  final String ownerEmail;
  final String unitAlias;

  const SendInvitationPage(
      {required this.description,
      required this.ownerEmail,
      required this.unitAlias,
      this.initFunction,
      this.completedMessage,
      this.completeFunction = navigateOffAllWrapper});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 32, 35, 22),
          child: Column(
            children: [
              MyPageAppBar(title: "Create unit", appBarType: MyAppBarType.xmark),
              Expanded(child: Container()),
              VRegCenterImageText(
                imagePath: "assets/images/green-tick.png",
                title: "Invite owner",
                description: description,
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
                    final Email email = Email(
                      recipients: [ownerEmail],
                      subject: "The-Hill Residence: Invitation to your new unit",
                      body: "Dear resident,\n\nUnit: $unitAlias\nOwner's email: $ownerEmail\n\n This unit is created under your email. Kindly login to The-Hill Residence App to activate your unit!\n\nBest regards,\nThe-Hill Residence App",
                      // NEXT: Add dynamic link
                    );

                    await FlutterEmailSender.send(email);
                  },
                  child: Text(
                    "Open email app",
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
                onTap: () => completeFunction!(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    completedMessage ?? "Click here to go back home",
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
