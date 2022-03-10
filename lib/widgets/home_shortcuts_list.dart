import "package:flutter/material.dart";
import 'package:the_hill_residence/widgets/shortcut_item.dart';

class HomeShortcutsList extends StatelessWidget {
  const HomeShortcutsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shortcuts",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).splashColor.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: SizedBox(
            height: 80,
            child: ListView.separated(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                IconData icon = Icons.settings;
                String text = "Settings";

                switch (index) {
                  case 0:
                    icon = Icons.settings;
                    text = "Settings";
                    break;
                  case 1:
                    icon = Icons.person;
                    text = "Profile";
                    break;
                  case 2:
                    icon = Icons.app_registration;
                    text = "Register";
                    break;
                  case 3:
                    icon = Icons.history;
                    text = "History";
                    break;
                }

                return ShortcutWidget(icon: icon, text: text);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 45);
              },
            ),
          ),
        )
      ],
    );
  }
}
