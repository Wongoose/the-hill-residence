import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/admin_controller.dart";
import "package:the_hill_residence/models/model_admin_classes.dart";
import "package:the_hill_residence/screens/admin/widgets/add_new_unit_item.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_unit_item.dart";

class AdminUnitsList extends StatelessWidget {
  const AdminUnitsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = Get.put(AdminController());

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: adminController.getUnits(),
            builder: (context, _) {
              return Obx(() {
                final List<Unit> data = adminController.units;
                return ListView.separated(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    itemCount: data.length + 1,
                    itemBuilder: (context, i) => i == 0 ? AddNewUnitItem() : AdminUnitItem(unit: data[i - 1]),
                    separatorBuilder: (context, i) => Divider(height: 60));
              });
            }));
  }
}
