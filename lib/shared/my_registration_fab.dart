import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MyRegFAB extends StatelessWidget {
  final Function onPressFunc;

  const MyRegFAB({
    Key? key,
    required this.onPressFunc,
  }) : super(key: key);

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
        backgroundColor: Color(0xff41aea9),
        foregroundColor: Colors.blueGrey[50],
        onPressed: onPressFunc(),
      ),
    );
  }
}
