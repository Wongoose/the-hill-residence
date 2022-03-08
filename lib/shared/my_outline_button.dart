import "package:flutter/material.dart";

class MyOutlineButton extends StatelessWidget {
  final String text;
  final Color color;
  const MyOutlineButton({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: color),
            ),
          ),
          onPressed: () async {},
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              text,
              style: TextStyle(
                // shadows: [
                //   Shadow(
                //       color: _themeProvider.primaryTextColor26,
                //       blurRadius: 10,
                //       offset: Offset(0.5, 0.5))
                // ],
                fontFamily: "Nunito Sans",
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          )),
    );
  }
}
