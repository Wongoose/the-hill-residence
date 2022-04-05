import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:image_stack/image_stack.dart";

class ProfileUserCard extends StatelessWidget {
  final List<String> listOfImages = [
    "assets/images/face.png",
    "assets/images/astronaut.jpg",
    "assets/images/zxprofile.png"
  ];

  ProfileUserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageStack(
                      imageSource: ImageSource.Asset,
                      totalCount: 3,
                      imageList: listOfImages,
                      imageRadius: 25, // Radius of each images
                      imageCount: 3, // Maximum number of images to be shown
                      imageBorderWidth: 1.5,
                      imageBorderColor:
                          Colors.black87, // Border width around the images
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () => {},
                      child: Icon(
                        Icons.more_horiz,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "You, Robert, and 1 more",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 50),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Icon(
            CupertinoIcons.add,
            color: Colors.black54,
            size: 20,
          ),
        ),
      ],
    );
  }
}
