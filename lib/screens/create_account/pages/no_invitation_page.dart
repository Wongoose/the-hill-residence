import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";
import "package:the_hill_residence/utilities/navigation.dart";

class NoInvitationPage extends StatelessWidget {
  final String? email;
  final VoidCallback? initFunction;
  final VoidCallback? completeFunction;
  final String? completedMessage;

  const NoInvitationPage({
    this.email,
    this.initFunction,
    this.completedMessage,
    this.completeFunction = navigateOffAllWrapper,
  });

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
                onTap: () => completeFunction!(),
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
