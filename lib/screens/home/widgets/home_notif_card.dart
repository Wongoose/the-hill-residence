import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/v-registration/pages/past_visitors_main.dart";
import "package:the_hill_residence/widgets/notification_item.dart";

class HomeNotifCard extends StatefulWidget {
  const HomeNotifCard({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeNotifCard> createState() => _HomeNotifCardState();
}

class _HomeNotifCardState extends State<HomeNotifCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Past visitors",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).splashColor.withOpacity(0.7),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => PastVisitorsMain()),
                child: Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Theme.of(context).splashColor.withOpacity(0.7),
                ),
              ),
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
              child: ListView.separated(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return NotificationItem();
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 50);
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
