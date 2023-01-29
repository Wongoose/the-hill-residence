import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/screens/home/widgets/home_appbar.dart";
import "package:the_hill_residence/screens/home/widgets/home_notif_card.dart";
import "package:the_hill_residence/screens/home/widgets/home_summary_card.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: HomeAppBar()),
          SizedBox(height: 20),
          HomeSummaryCard(),
          SizedBox(height: 30),
          Expanded(child: HomeNotifCard()),
        ],
      ),
    );
  }
}
