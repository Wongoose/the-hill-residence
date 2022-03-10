import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:get/get.dart';

class MyPageAppBar extends StatelessWidget {
  final String title;
  const MyPageAppBar({
    Key? key,
    required this.title,
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
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
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
