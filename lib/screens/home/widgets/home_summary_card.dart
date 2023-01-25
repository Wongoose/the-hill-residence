import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/services/firebase/auth.dart";

class HomeSummaryCard extends StatelessWidget {
  const HomeSummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find();
    return Obx(() {
      return Card(
        color: authService.appUser.visitorSummaryCardColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
          width: MediaQuery.of(context).size.width,
          child: Row(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: authService.appUser.visitorSummaryImageColor ?? Colors.white38,
              ),
              // circular profile picture inside
              child: Image(image: AssetImage("assets/images/${authService.appUser.visitorSummaryImage}")),
            ),
            SizedBox(width: 20),
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authService.appUser.visitorSummaryTitle,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      authService.appUser.visitorSummaryDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                  ]),
            ),
          ]),
        ),
      );
    });
  }
}
