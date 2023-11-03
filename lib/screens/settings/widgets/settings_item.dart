import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

enum MySettingsItemAction { toggle, more, none }

class MySettingsItem extends StatelessWidget {
  final IconData itemIcon;
  final String text;
  final Color? color;
  final MySettingsItemAction? itemAction;
  final VoidCallback? onPressed;

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
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
        ),
        child: Row(children: [
          Icon(itemIcon, color: color ?? Theme.of(context).primaryColor, size: 20),
          SizedBox(width: 10),
          Text(text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color ?? themeService.textColor)),
          Expanded(child: Container()),
          itemAction == MySettingsItemAction.none
              ? Container()
              : itemAction == MySettingsItemAction.toggle
                  ? Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      child: Switch(
                          activeColor: Theme.of(context).colorScheme.secondary,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: themeService.themeMode == ThemeMode.dark,
                          onChanged: (value) => themeService.switchTheme()),
                    )
                  : Icon(CupertinoIcons.forward, color: color ?? themeService.textColor),
        ]),
      ),
    );
  }
}
