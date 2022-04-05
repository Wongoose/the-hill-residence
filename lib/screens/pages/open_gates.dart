import "package:circular_countdown_timer/circular_countdown_timer.dart";
import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class OpenGatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(35, 32, 35, 32),
        child: Column(
          children: [
            MyPageAppBar(title: "Open gates", appBarType: MyAppBarType.xmark),
            Expanded(child: Container()),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CircularCountDownTimer(
                  width: 250,
                  height: 250,
                  duration: 30,
                  ringColor: Colors.white,
                  fillColor: Theme.of(context).primaryColor,
                  strokeWidth: 15,
                  isReverse: true,
                  autoStart: true,
                  strokeCap: StrokeCap.round,
                  isTimerTextShown: false,
                ),
                Icon(
                  Icons.key,
                  size: 130,
                  color: Colors.black.withOpacity(0.8),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Opening gates...",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Please wait while the gates open automatically.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Nunito",
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Text(
              "Something went wrong?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Re-open gates",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
