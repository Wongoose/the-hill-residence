import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/profile/pages/profile_main.dart";

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return Container(
      // padding right 22 + 5 following HOME
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.fromLTRB(27, 32, 27, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Settings",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Nunito",
              color: themeService.textColor,
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
      ),
    );
  }
}
