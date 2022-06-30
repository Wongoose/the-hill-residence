import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:the_hill_residence/shared/my_text_widgets.dart";

class ManageAccDialog extends StatelessWidget {
  const ManageAccDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 60),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(children: [
                MyTextBolded("Manage account", fontSize: 24, textAlign: TextAlign.center),
                SizedBox(height: 25),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(height: 80, width: 80, image: AssetImage("assets/images/face.png"))),
                SizedBox(height: 15),
                Text("John Doe",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: Colors.black.withOpacity(0.7))),
                Divider(height: 40),
                Row(children: [
                  Icon(Icons.phone, size: 14, color: Theme.of(context).primaryColor),
                  SizedBox(width: 7),
                  Text("+6016-331 5288",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.7),
                          letterSpacing: 0.5)),
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Icon(FontAwesomeIcons.calendar, size: 14, color: Theme.of(context).primaryColor),
                  SizedBox(width: 7),
                  Text("20th Apr 2022",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.7),
                          letterSpacing: 0.5)),
                ]),
                SizedBox(height: 15),
              ])),
          Container(
              margin: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.transparent,
              child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close",
                      style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500)))),
        ]));
  }
}
