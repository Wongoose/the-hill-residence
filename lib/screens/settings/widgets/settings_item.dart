import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

enum MySettingsItemAction { toggle, more, none }

class MySettingsItem extends StatelessWidget {
  final IconData itemIcon;
  final String text;
  final Color? color;
  final MySettingsItemAction? itemAction;
  final Function? onPressed;

  const MySettingsItem({
    Key? key,
    required this.text,
    required this.itemIcon,
    this.color,
    this.itemAction = MySettingsItemAction.more,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed!(),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xfff6fbfd),
        ),
        child: Row(
          children: [
            Icon(
              itemIcon,
              // CupertinoIcons.person,
              color: color ?? Theme.of(context).primaryColor,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color ?? Colors.black,
              ),
            ),
            Expanded(child: Container()),
            if (itemAction == MySettingsItemAction.none)
              Container()
            else
              itemAction == MySettingsItemAction.toggle
                  ? Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      child: Switch(
                          activeColor: Theme.of(context).accentColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: true,
                          onChanged: (value) {}))
                  : Icon(
                      CupertinoIcons.forward,
                      color: color ?? Colors.black,
                    ),
          ],
        ),
      ),
    );
  }
}
