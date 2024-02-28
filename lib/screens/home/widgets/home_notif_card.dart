import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/screens/home/pages/all_visitors_main.dart";
import "package:the_hill_residence/screens/home/widgets/single_visitors_list_item.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/services/firebase/visitor_db.dart";
import "package:the_hill_residence/shared/my_theme_divider.dart";

class HomeNotifCard extends StatelessWidget {
  const HomeNotifCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VisitorDBService _db = Get.put(VisitorDBService());
    final AuthService authService = Get.find();
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Upcoming visitors",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: themeService.textColor87)),
              GestureDetector(
                  onTap: () => Get.to(() => AllVisitorsMain()),
                  child: Icon(Icons.more_horiz, size: 30, color: themeService.textColor70)),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Card(
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              // padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: _db.getVisitors(),
                builder: (context, snapshot) {
                  return Obx(() {
                    final List<Visitor> data = authService.appUser.upcomingVisitors;
                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return SingleVisitorListItem(visitor: data[index], upcoming: true);
                      },
                      separatorBuilder: (context, index) {
                        return ThemedDivider(height: 50);
                      },
                    );
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
