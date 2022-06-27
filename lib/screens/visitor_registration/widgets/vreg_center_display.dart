import "package:flutter/material.dart";

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
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              fontFamily: "Nunito",
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}