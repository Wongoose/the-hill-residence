import "package:circular_countdown_timer/circular_countdown_timer.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class OpenGatesScreen extends StatefulWidget {
  final CountDownController _countDownController = CountDownController();
  @override
  State<OpenGatesScreen> createState() => _OpenGatesScreenState();
}

class _OpenGatesScreenState extends State<OpenGatesScreen> {
  final MyThemeServiceController themeService = Get.put(MyThemeServiceController());

  bool showTrigger = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Padding(
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
                      controller: widget._countDownController,
                      width: 250,
                      height: 250,
                      duration: 30,
                      ringColor: Theme.of(context).cardColor,
                      fillColor: Theme.of(context).primaryColor,
                      strokeWidth: 15,
                      isReverse: true,
                      autoStart: false,
                      strokeCap: StrokeCap.round,
                      isTimerTextShown: false,
                    ),
                    Icon(
                      Icons.key,
                      size: 130,
                      color: themeService.textColor87,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                // Text(
                //   "Opening gates...",
                //   style: TextStyle(
                //     fontSize: 35,
                //     fontWeight: FontWeight.bold,
                //     fontFamily: "Nunito",
                //     color: Colors.black,
                //   ),
                // ),
                // SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Please wait while the gates open automatically.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Nunito",
                      color: themeService.textColor,
                    ),
                  ),
                ),
                Expanded(flex: 2, child: Container()),
                Text(
                  "Gates not working?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: themeService.textColor87,
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
          Visibility(
            visible: showTrigger,
            child: GestureDetector(
              onTap: () {
                widget._countDownController.start();
                setState(() => showTrigger = false);
              },
              child: Opacity(
                opacity: 0.85,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.touch_app_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Tap anywhere on the screen to open gate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
