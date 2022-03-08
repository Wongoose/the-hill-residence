import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/pages/vreg_contact.dart";
import "package:the_hill_residence/shared/my_bottom_navbar.dart";
import "package:the_hill_residence/shared/my_fab.dart";
import "package:the_hill_residence/widgets/home_appbar.dart";
import "package:the_hill_residence/widgets/home_notif_card.dart";
import "package:the_hill_residence/widgets/home_shortcuts_list.dart";
import "package:the_hill_residence/widgets/home_summary_card.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 22),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: HomeAppBar(),
              ),
              SizedBox(height: 20),
              // summary card
              HomeSummaryCard(),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: HomeShortcutsList(),
              ),
              SizedBox(height: 30),
              Expanded(
                child: HomeNotifCard(),
              ),
            ],
          ),
        ),
        floatingActionButton: MyFAB(
          onPressFunc: () => Get.to(() => VRegContact()),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
