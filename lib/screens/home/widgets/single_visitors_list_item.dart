import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/shared/visitor_info_dialog.dart";

class SingleVisitorListItem extends StatelessWidget {
  final Visitor visitor;
  final bool upcoming;

  const SingleVisitorListItem({
    Key? key,
    required this.visitor,
    this.upcoming = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.dialog(VisitorInfoDialog(visitor: visitor, showArrivalStatus: upcoming)),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: upcoming ? visitor.listIconColor : Colors.amber.withOpacity(0.1)),
              child: Image(image: AssetImage("assets/images/${upcoming ? visitor.listIconImage : "pencil.png"}")),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  visitor.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  upcoming ? "Arriving ${visitor.getDisplayArrival}" : "Registered on ${visitor.registerDateDisplay}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
                ),
              ],
            ),
          ]),
    );
  }
}
