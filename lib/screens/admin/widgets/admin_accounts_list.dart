import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/admin_controller.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_account_item.dart";

class AdminAccountsList extends StatelessWidget {
  const AdminAccountsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = Get.put(AdminController());
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: adminController.getAccounts(),
            builder: (context, _) {
              return Obx(() {
                final List<Account> data = adminController.accounts;
                return ListView.separated(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    itemCount: data.length,
                    itemBuilder: (context, i) => AdminAccountItem(account: data[i]),
                    separatorBuilder: (context, index) => Divider(height: 60));
              });
            }));
  }
}
