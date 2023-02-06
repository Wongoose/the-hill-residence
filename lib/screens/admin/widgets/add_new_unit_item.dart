import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/admin/pages/admin_add_new_unit.dart";

class AddNewUnitItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.to(() => AddNewUnitPage()),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(CupertinoIcons.add, color: themeService.textColor54),
            ),
            SizedBox(width: 20),
            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Add a new unit",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: themeService.textColor)),
              SizedBox(height: 4),
              Text("Click to add a new unit",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: themeService.textColor))
            ]),
          ]),
    );
  }
}
