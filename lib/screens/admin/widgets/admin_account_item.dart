import "package:flutter/material.dart";
import "package:the_hill_residence/utilities/show_dialog.dart";

class AdminAccountItem extends StatelessWidget {
  const AdminAccountItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => showManageAccDialog(),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Theme.of(context).primaryColor.withOpacity(0.1)),
                child: Opacity(opacity: 0.9, child: Image(image: AssetImage("assets/images/user.png")))),
            SizedBox(width: 20),
            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Robert", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 4),
              Text(
                "Unit 103",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
              ),
            ]),
            Expanded(child: Container()),
            Icon(Icons.edit, size: 18, color: Colors.black54),
          ]),
    );
  }
}
