import "package:flutter/material.dart";

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue.withOpacity(0.12),
          ),
          // circular profile picture inside
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              image: AssetImage("assets/images/astronaut.jpg"),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Visitor Ben",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Arrived - Sep 10, 2021",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
