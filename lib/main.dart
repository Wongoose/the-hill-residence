import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import 'package:the_hill_residence/controllers/theme_get_controller.dart';
import "package:the_hill_residence/screens/auth/auth_home.dart";
import "package:the_hill_residence/screens/home/splash_screen.dart";
import 'package:the_hill_residence/shared/constants.dart';
import "package:the_hill_residence/utilities/delay.dart";
import "package:overlay_support/overlay_support.dart";

void main() {
  runApp(const TheHillApp());
}

class TheHillApp extends StatelessWidget {
  const TheHillApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return OverlaySupport.global(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "The-Hill Residence",
        themeMode: ThemeMode.dark,
        theme: myThemeData.copyWith(
          backgroundColor: Colors.white,
        ),
        darkTheme: myThemeData.copyWith(
          backgroundColor: Color(0xFF0D0D0D),
        ),
        home: FutureBuilder(
          future: delaySeconds(1),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("main.dart | FutureBuilder error: ${snapshot.error}");
            } else if (snapshot.connectionState == ConnectionState.done) {
              return AuthHome();
            }
            // while loading show Splash
            return SplashScreen();
          },
        ),
      ),
    );
  }
}

class TheHillMain extends StatefulWidget {
  @override
  State<TheHillMain> createState() => _TheHillMainState();
}

class _TheHillMainState extends State<TheHillMain> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "You have pushed the button this many times:",
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}
