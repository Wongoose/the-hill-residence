import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/screens/home/pages/past_visitors_main.dart";
import "package:the_hill_residence/screens/home/widgets/single_visitors_list_item.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/services/firebase/visitor_db.dart";

class HomeNotifCard extends StatelessWidget {
  const HomeNotifCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VisitorDBService _db = Get.put(VisitorDBService());
    final AuthService authService = Get.find();
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
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).splashColor.withOpacity(0.7))),
              GestureDetector(
                  onTap: () => Get.to(() => PastVisitorsMain()),
                  child: Icon(Icons.more_horiz, size: 30, color: Theme.of(context).splashColor.withOpacity(0.7))),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              // padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: _db.getVisitors(),
                builder: (context, snapshot) {
                  final List<Visitor> data = authService.appUser.upcomingVisitors;

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return SingleVisitorListItem(visitor: data[index], upcoming: true);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 50);
                    },
                  );
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
