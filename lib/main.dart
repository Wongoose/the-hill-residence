import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import 'package:the_hill_residence/screens/auth/auth_home.dart';
import 'package:the_hill_residence/screens/home/home.dart';
import "package:the_hill_residence/screens/home/splash_screen.dart";
import "package:the_hill_residence/utilities/delay.dart";

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

    return FutureBuilder(
      future: delaySeconds(1),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("main.dart | FutureBuilder error: ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: "The-Hill Residence",
            darkTheme: ThemeData(
              primaryColor: Color(0xFF34A382),
              accentColor: Color(0xff4DB8DE),
              backgroundColor: Color(0xFF0D0D0D),
              splashColor: Color(0xFF072227),
              cardColor: Color(0xFF40514E),
            ),

            // builder: (context, child) {
            //   return MediaQuery(
            //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            //     child: SplashScreen(),
            //   );
            // },
            home: Home(),
          );
        }
        // while loading show Splash
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
              primaryColor: Color(0xFF12CC94),
              accentColor: Color.fromARGB(255, 17, 39, 47),
              backgroundColor: Color(0xFF0D0D0D),
              splashColor: Color(0xFF072227),
              cardColor: Color(0xFF40514E)),
          home: SplashScreen(),
        );
      },
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
