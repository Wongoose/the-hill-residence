import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

enum MyAppBarType { back, xmark }

class MyPageAppBar extends StatelessWidget {
  final String title;
  final MyAppBarType appBarType;
  const MyPageAppBar({
    Key? key,
    required this.title,
    required this.appBarType,
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
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black26,
                width: 0.5,
              ),
            ),
            child: Icon(
              appBarType == MyAppBarType.back
                  ? CupertinoIcons.back
                  : CupertinoIcons.xmark,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito",
            color: Colors.black,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            Icons.cancel_outlined,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 25,
          ),
        ),
      ],
    );
  }
}
