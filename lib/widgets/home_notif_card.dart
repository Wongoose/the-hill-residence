import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/pages/vrecords_main.dart";
import "package:the_hill_residence/widgets/notification_item.dart";

class HomeNotifCard extends StatelessWidget {
  const HomeNotifCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () => Get.to(() => VRecordsMain()),
            child: Text(
              "Notifications",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).splashColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                // padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return NotificationItem();
                  },
                  separatorBuilder: (context, index) {
                    return Divider(height: 30);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
