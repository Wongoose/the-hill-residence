import "package:flutter/material.dart";
import "package:get/get.dart";

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: BottomAppBar(
        elevation: 5,
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(45, 2, 45, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Icon(
                  Icons.home,
                  color: Theme.of(context).primaryColor,
                  size: 35,
                ),
              ),
              Expanded(child: Text("")),
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.settings,
                    color: Colors.blueGrey[300],
                    size: 35,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
