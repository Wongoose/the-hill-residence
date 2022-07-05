import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:the_hill_residence/screens/profile/pages/profile_main.dart';

class PastVisitorsAppBar extends StatelessWidget {
  const PastVisitorsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          behavior: HitTestBehavior.translucent,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black26,
                width: 0.5,
              ),
            ),
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black87,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.to(() => UserProfile()),
          child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[200],
            ),
            // circular profile picture inside
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage("assets/images/face.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
