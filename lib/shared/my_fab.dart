import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:the_hill_residence/widgets/home_shortcuts_list.dart';
import 'package:the_hill_residence/widgets/shortcut_item.dart';

class MyFAB extends StatelessWidget {
  final Widget navToWidget;
  const MyFAB({required this.navToWidget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(30, 25, 30, 32),
                  child: HomeShortcutsList(),
                );
              });
        },
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
