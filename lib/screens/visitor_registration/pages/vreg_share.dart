import "package:flutter/material.dart";
import "package:share_plus/share_plus.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/shared/my_fill_primary_btn.dart";
import "package:the_hill_residence/shared/my_outline_button.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";
import "package:whatsapp_share2/whatsapp_share2.dart";

class VRegShare extends StatelessWidget {
  final Visitor visitor;
  const VRegShare({Key? key, required this.visitor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String message =
        "You are invited to The-Hill Residence!\nLocation: bit.ly/hill88\nDate of entry: ${visitor.entryDateDisplay}\n\nPlease click this link to open the gate when you arrive:\nhttps://thehillpenang.github.io/?code=11140";

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wohoo",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Registration complete!",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              VRegCenterImageText(
                imagePath: "assets/images/social-media.png",
                title: "Share key!",
                description: "Please share the entry key. Your visitor will need this key to open the gate.",
              ),
              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: MyFillButton(
                      icon: Icon(Icons.whatsapp, size: 38),
                      text: "Send via WhatsApp",
                      color: Theme.of(context).primaryColor,
                      onPressFunc: () async {
                        await WhatsappShare.share(text: message, phone: visitor.phone);
                        navigateOffAllHome();
                      })),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: MyOutlineButton(
                      text: "or use another app",
                      color: Theme.of(context).primaryColor,
                      onPressFunc: () async {
                        await Share.share(message);
                        navigateOffAllHome();
                      })),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
