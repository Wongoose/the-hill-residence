import "package:flutter/material.dart";

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
    return GestureDetector(
      onTap: () => setState(() => expanded = !expanded),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xfff6fbfd),
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
                      color: Colors.black,
                    ),
                  ),
                  if (expanded) SizedBox(height: 20),
                  if (expanded)
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
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
