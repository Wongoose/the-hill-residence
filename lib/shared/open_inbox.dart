import "package:flutter/material.dart";
import "package:overlay_support/overlay_support.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "package:open_mail_app/open_mail_app.dart";

class OpenInboxScreen extends StatefulWidget {
  final String description;
  final VoidCallback? initFunction;
  final VoidCallback? completeFunction;
  final String? completedMessage;

  const OpenInboxScreen(
      {required this.description,
      this.initFunction,
      this.completedMessage,
      this.completeFunction = navigateOffAllWrapper});

  @override
  State<OpenInboxScreen> createState() => _OpenInboxScreenState();
}

class _OpenInboxScreenState extends State<OpenInboxScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.initFunction != null) widget.initFunction!();
  }

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
                description: widget.description,
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
                    final OpenMailAppResult result = await OpenMailApp.openMailApp();
                    if (!result.didOpen && !result.canOpen) {
                      // NEXT: Decide use toast or Get.snackbar
                      toast("Oops! No mail apps installed.");
                    } else if (!result.didOpen && result.canOpen) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return MailAppPickerDialog(
                            mailApps: result.options,
                          );
                        },
                      );
                    }
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
                onTap: () => widget.completeFunction!(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    widget.completedMessage ?? "Click here to go back home",
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
