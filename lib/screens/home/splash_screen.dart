import "package:flutter/material.dart";
import "package:the_hill_residence/utilities/background_loading.dart";

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: Column(
        children: [
          Expanded(child: Container()),
          Center(
            child: Image(
              image: AssetImage("assets/icons/the-hill-icon.png"),
              height: 100,
              width: 100,
            ),
          ),
          Expanded(child: Container()),
          SmallCubeLoading(),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}
