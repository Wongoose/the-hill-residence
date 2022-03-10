import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class MyFAB extends StatelessWidget {
  final Widget navToWidget;
  const MyFAB({required this.navToWidget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        onPressed: () => Get.to(() => navToWidget),
        child: Icon(
          CupertinoIcons.square_grid_2x2,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
