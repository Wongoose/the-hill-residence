import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MyRegFAB extends StatelessWidget {
  final Function? onPressed;

  const MyRegFAB({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: FloatingActionButton(
        clipBehavior: Clip.antiAlias,
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: Icon(CupertinoIcons.forward, size: 25),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.blueGrey[50],
        onPressed: () => onPressed!(),
      ),
    );
  }
}
