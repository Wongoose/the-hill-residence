import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_theme_divider.dart";

class ManageAccDialogActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
          child: Container(
              margin: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.transparent,
              child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.phone, color: Theme.of(context).colorScheme.secondary)))),
      ThemedVerticalDivider(thickness: 0.5, indent: 12, endIndent: 12),
      Expanded(
          child: Container(
              margin: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.transparent,
              child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.home, color: Theme.of(context).colorScheme.secondary)))),
      ThemedVerticalDivider(thickness: 0.5, indent: 12, endIndent: 12),
      Expanded(
          child: Container(
              margin: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.transparent,
              child:
                  TextButton(onPressed: () => Navigator.pop(context), child: Icon(Icons.delete, color: Colors.red)))),
    ]));
  }
}
