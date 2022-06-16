import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/shared/visitor_info_dialog.dart";

class SingleVisitorListItem extends StatelessWidget {
  final int index;
  const SingleVisitorListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.dialog(VisitorInfoDialog());
      },
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
              color: index % 4 == 0
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.amber.withOpacity(0.1),
            ),
            // circular profile picture inside
            child: Image(
              image: AssetImage((index % 4 == 0)
                  ? "assets/images/arrived-darkblue.png"
                  : "assets/images/pencil.png"),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Robert",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "${(index % 4 == 0) ? "Visitor arrived" : "Visitor registered"} - Sep 10, 2021",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
