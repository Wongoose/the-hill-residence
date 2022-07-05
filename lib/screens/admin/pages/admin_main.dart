import "package:flutter/material.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_records_card.dart";
import "package:the_hill_residence/screens/admin/widgets/admin_tabbar.dart";
import 'package:the_hill_residence/shared/my_fab.dart';
import "package:the_hill_residence/shared/my_page_appbar.dart";

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 0),
          child: Column(
            children: [
              MyPageAppBar(
                  title: "Admin center", appBarType: MyAppBarType.xmark),
              SizedBox(height: 40),
              AdminTabBar(tabController: _tabController),
              SizedBox(height: 40),
              Expanded(
                child: AdminRecordsCard(
                  tabController: _tabController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
