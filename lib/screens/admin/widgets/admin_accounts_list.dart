import "package:flutter/material.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_account_item.dart";

class AdminAccountsList extends StatelessWidget {
  const AdminAccountsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            itemCount: 12,
            itemBuilder: (context, index) => AdminAccountItem(),
            separatorBuilder: (context, index) => Divider(height: 60)));
  }
}
