import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:image_stack/image_stack.dart";
import "package:the_hill_residence/controllers/user_details_controller.dart";

class ProfileImgStack extends StatelessWidget {
  const ProfileImgStack({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.put(UserDetailsController());
    final Future<List<Widget>?> _future = userDetailsController.getResidentImages();
    final List<String> listOfImages = [
      "assets/images/face.png",
      "assets/images/astronaut.jpg",
    ];
    // Next: Use Obx
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final List<Widget> widgets = snapshot.data!;
            return ImageStack.widgets(
              totalCount: widgets.length,
              widgetRadius: 25, // Radius of each images
              widgetCount: 3, // Maximum number of images to be shown
              widgetBorderWidth: 1.5,
              widgetBorderColor: Colors.black87,
              children: widgets,
            );
          } else {
            return ImageStack(
              imageSource: ImageSource.Asset,
              totalCount: 3,
              imageList: listOfImages,
              imageRadius: 25, // Radius of each images
              imageCount: 3, // Maximum number of images to be shown
              imageBorderWidth: 1.5,
              imageBorderColor: Colors.black87, // Border width around the images
            );
          }
        });
  }
}
