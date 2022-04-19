import "package:flutter/material.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_account_item.dart";
import 'package:the_hill_residence/screens/admin/widgets/admin_accounts_list.dart';
import 'package:the_hill_residence/screens/admin/widgets/admin_pending_item.dart';
import 'package:the_hill_residence/screens/admin/widgets/admin_pending_list.dart';
import 'package:the_hill_residence/screens/admin/widgets/admin_unit_item.dart';
import 'package:the_hill_residence/screens/admin/widgets/admin_units_list.dart';

class AdminRecordsCard extends StatelessWidget {
  final TabController tabController;
  const AdminRecordsCard({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "All records (12)",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).splashColor.withOpacity(0.7),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              border: Border.all(
                color: Colors.black12,
                width: 0.5,
              ),
            ),
            child: TabBarView(
              controller: tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                AdminAccountsList(),
                AdminUnitsList(),
                AdminPendingList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
