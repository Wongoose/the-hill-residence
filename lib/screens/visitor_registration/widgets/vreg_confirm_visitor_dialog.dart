import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/screens/visitor_registration/pages/vreg_share.dart";
import "package:the_hill_residence/services/firebase/visitor_db.dart";

class ConfirmVisitorDialog extends StatelessWidget {
  final Visitor visitor;
  const ConfirmVisitorDialog({Key? key, required this.visitor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VisitorDBService db = Get.put(VisitorDBService());
    return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: EdgeInsets.symmetric(horizontal: 60),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(32, 22, 32, 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Text(
                  "Confirm visitor?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    height: 80,
                    width: 80,
                    image: AssetImage("assets/images/face.png"),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  visitor.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                Divider(height: 40),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Icon(Icons.phone, size: 14, color: Theme.of(context).primaryColor),
                    SizedBox(width: 7),
                    Text(visitor.phone,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(0.7),
                            letterSpacing: 0.5)),
                  ]),
                  SizedBox(height: 5),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(FontAwesomeIcons.calendar, size: 14, color: Theme.of(context).primaryColor),
                    SizedBox(width: 7),
                    Text(visitor.dialogDateDisplay,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(0.7),
                            letterSpacing: 0.5)),
                  ]),
                ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Theme.of(context).primaryColor,
            child: TextButton(
              onPressed: () async {
                String? visitorID = await db.createNewVisitor(visitor);
                if (visitorID != null) {
                  visitor.id = visitorID;
                  Get.to(() => VRegShare(visitor: visitor), transition: Transition.native);
                }
              },
              child: Text(
                "Confirm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
