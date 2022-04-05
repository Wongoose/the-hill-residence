import "package:flutter/material.dart";

class ShortcutWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const ShortcutWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
            ),
            Icon(
              icon,
              size: 40,
              color: Theme.of(context).primaryColor.withOpacity(0.8),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
