import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/models/model_visitor.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/past_visitors_appbar.dart";
import "package:the_hill_residence/screens/home/widgets/single_visitors_list_item.dart";
import "package:the_hill_residence/services/firebase/auth.dart";
import "package:the_hill_residence/services/firebase/visitor_db.dart";

class PastVisitorsMain extends StatelessWidget {
  const PastVisitorsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VisitorDBService _db = Get.put(VisitorDBService());
    final AuthService authService = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 0, 0),
          child: Column(
            children: [
              Padding(
                // padding right 22 + 5 following HOME
                padding: EdgeInsets.fromLTRB(0, 0, 27, 0),
                child: PastVisitorsAppBar(),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Past visitors",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: Theme.of(context).splashColor,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  // padding: EdgeInsets.fromLTRB(30, 40, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1.5,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: FutureBuilder(
                    future: _db.getVisitors(),
                    builder: (context, visitors) {
                      final List<Visitor> data = authService.appUser.pastVisitors;
                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(30, 40, 10, 40),
                        itemCount: data.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SingleVisitorListItem(visitor: data[index]);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(height: 50);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
