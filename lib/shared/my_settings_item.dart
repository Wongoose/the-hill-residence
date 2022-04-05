import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MySettingsItem extends StatelessWidget {
  final IconData itemIcon;
  final String text;

  const MySettingsItem({Key? key, required this.text, required this.itemIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFe7f4f8),
      ),
      child: Row(
        children: [
          Icon(
            itemIcon,
            // CupertinoIcons.person,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Expanded(child: Container()),
          Icon(
            CupertinoIcons.forward,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
