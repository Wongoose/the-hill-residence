import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:the_hill_residence/screens/home/widgets/home_shortcuts_list.dart";

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
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              enableDrag: false,
              context: context,
              builder: (context) {
                return HomeShortcutsList();
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
