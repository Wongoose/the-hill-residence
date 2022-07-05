import "package:flutter/material.dart";
import 'package:the_hill_residence/screens/admin/widgets/add_new_user_tile.dart';
import "package:the_hill_residence/screens/admin/widgets/admin_account_item.dart";

class AdminAccountsList extends StatelessWidget {
  const AdminAccountsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 0)
          {
            return AddNewUserTile();
          }else {
            return AdminAccountItem();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(height: 60);
        },
      ),
    );
  }
}
