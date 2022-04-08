import 'package:flutter/material.dart';

class SettingsPlainItem extends StatelessWidget {
  final IconData itemIcon;
  final String text;

  const SettingsPlainItem(
      {Key? key, required this.itemIcon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
