import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class FAQItem extends StatefulWidget {
  final String question;
  final String description;

  const FAQItem({
    Key? key,
    required this.question,
    required this.description,
  });

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

    return GestureDetector(
      onTap: () => setState(() => expanded = !expanded),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              expanded ? Icons.remove_circle : Icons.expand_circle_down,
              // CupertinoIcons.person,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
            SizedBox(width: 15),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.question,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: themeService.textColor,
                    ),
                  ),
                  if (expanded) SizedBox(height: 20),
                  if (expanded)
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: themeService.textColor70,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
