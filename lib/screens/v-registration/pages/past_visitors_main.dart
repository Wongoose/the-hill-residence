import "package:flutter/material.dart";
import "package:the_hill_residence/screens/v-registration/widgets/past_visitors_appBar.dart";
import "package:the_hill_residence/screens/v-registration/widgets/past_visitors_list_item.dart";

class PastVisitorsMain extends StatelessWidget {
  const PastVisitorsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(30, 40, 10, 40),
                    itemCount: 20,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SingleVisitorListItem(index: index);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 50);
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
