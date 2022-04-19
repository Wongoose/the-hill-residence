import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_fill_primary_btn.dart";
import "package:the_hill_residence/shared/my_outline_button.dart";
import 'package:the_hill_residence/utilities/navigation.dart';
import "package:the_hill_residence/widgets/vreg_center_display.dart";

class VRegShare extends StatelessWidget {
  const VRegShare({Key? key}) : super(key: key);

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
                description:
                    "Don't forget to send the entry key to your visitor. He/she'll need it later.",
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: MyFillButton(
                  icon: Icon(Icons.whatsapp, size: 38),
                  text: "Send via WhatsApp",
                  color: Theme.of(context).primaryColor,
                  onPressFunc: navigateOffAllHome,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: MyOutlineButton(
                    text: "Or use another app",
                    color: Theme.of(context).primaryColor),
              ),
              Expanded(
                child: Container(),
              ),
              // Row - Next button
            ],
          ),
        ),
      ),
    );
  }
}
