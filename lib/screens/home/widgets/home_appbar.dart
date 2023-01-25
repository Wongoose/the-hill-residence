import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:the_hill_residence/controllers/theme_service_controller.dart';
import "package:the_hill_residence/controllers/user_details_controller.dart";
import "package:the_hill_residence/screens/profile/pages/profile_main.dart";

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.put(UserDetailsController());
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
            child: Obx(
              () => Text(
                "Welcome, ${userDetailsController.fullName}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: themeService.textColor54,
                ),
              ),
            ),
          ),
          SizedBox(height: 2.5),
          Text(
            "Your summary",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: themeService.textColor87,
            ),
          ),
        ]),
        // background profile picture
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
