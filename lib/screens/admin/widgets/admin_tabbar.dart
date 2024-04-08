import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class AdminTabBar extends StatelessWidget {
  const AdminTabBar({Key? key, required TabController tabController})
      : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: themeService.textColor12),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: false,
        dividerHeight: 0,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Theme.of(context).primaryColor,
          // border: Border.all(color: themeService.textColor12),
        ),
        labelStyle: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Nunito", fontWeight: FontWeight.w700),
        unselectedLabelColor: themeService.textColor45,
        unselectedLabelStyle: TextStyle(fontSize: 14, fontFamily: "Nunito", fontWeight: FontWeight.w600),
        tabs: [
          Tab(text: "Accounts"),
          Tab(text: "Units"),
        ],
      ),
    );
  }
}
