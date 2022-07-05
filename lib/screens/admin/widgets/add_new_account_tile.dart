import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class AddNewAccountTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => {},
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey.withOpacity(0.1)),
                child: Icon(CupertinoIcons.add, color: Colors.black54)),
            SizedBox(width: 20),
            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Add a new account",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 4),
              Text("Click to add a new account",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black))
            ]),
          ]),
    );
  }
}
