import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class VRegCenterImageText extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const VRegCenterImageText({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image(
            height: 230,
            image: AssetImage(imagePath),
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito",
            color: themeService.textColor,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: "Nunito",
              color: themeService.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
