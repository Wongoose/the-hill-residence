import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_accounts_list.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_units_list.dart";

class AdminRecordsCard extends StatelessWidget {
  final TabController tabController;
  const AdminRecordsCard({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.max, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          "All records (12)",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: themeService.textColor),
        ),
      ),
      SizedBox(height: 10),
      Expanded(
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  border: Border.all(color: Colors.black12, width: 0.5)),
              child: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  AdminAccountsList(),
                  AdminUnitsList(),
                ],
              ))),
    ]);
  }
}
