import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

class MyFillButton extends StatelessWidget {
  final Icon? icon;
  final String text;
  final Color color;
  final Function? onPressFunc;
  const MyFillButton({
    required this.text,
    required this.color,
    required this.onPressFunc,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          onPressed: () async => onPressFunc!() ?? toast("error"),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? Container(),
                SizedBox(width: icon == null ? 0 : 10),
                Text(
                  text,
                  style: TextStyle(
                    // shadows: [
                    //   Shadow(
                    //       color: _themeProvider.primaryTextColor26,
                    //       blurRadius: 10,
                    //       offset: Offset(0.5, 0.5))
                    // ],
                    fontFamily: "Nunito",
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
