import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class OtherAuthProviderOptions extends StatelessWidget {
  final String text;
  const OtherAuthProviderOptions({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            primary: Color(0xFFe7f4f8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: Colors.black.withOpacity(0.15)),
            ),
          ),
          onPressed: () async {},
          child: Icon(
            FontAwesomeIcons.facebookF,
            color: Colors.blue[400],
            size: 20,
          ),
        ),
        SizedBox(width: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            primary: Color(0xFFe7f4f8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: Colors.black.withOpacity(0.15)),
            ),
          ),
          onPressed: () async {},
          child: Icon(
            FontAwesomeIcons.google,
            color: Colors.red[400],
            size: 20,
          ),
        ),
        // SizedBox(width: 25),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Nunito",
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
        ),
      ],
    );
  }
}
