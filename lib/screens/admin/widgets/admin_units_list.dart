import "package:flutter/material.dart";
import "package:the_hill_residence/screens/admin/widgets/add_new_unit_item.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_unit_item.dart";

class AdminUnitsList extends StatelessWidget {
  const AdminUnitsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            itemCount: 12,
            itemBuilder: (context, index) => index == 0 ? AddNewUnitItem() : AdminUnitItem(),
            separatorBuilder: (context, index) => Divider(height: 60)));
  }
}
