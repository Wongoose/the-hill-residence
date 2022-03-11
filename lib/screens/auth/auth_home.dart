import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:the_hill_residence/screens/home/home.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  // height: MediaQuery.of(context).size.height - 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100000)),
                    child: Image(
                      height: 250,
                      image: AssetImage("assets/images/astronaut.jpg"),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "The-Hill",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Simple. Convenient. Secure.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Nunito",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 1),
              ),
              alignment: Alignment.center,
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                    width: 170,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // primary: Color(0xff41aea9),
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          textStyle: TextStyle(
                              fontFamily: "Nunito",
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        onPressed: () => Get.to(() => Home()),
                        child: Text("I have an account")),
                  ),
                  SizedBox(
                    height: 60,
                    width: 170,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          textStyle: TextStyle(
                              fontFamily: "Nunito",
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        onPressed: () => {},
                        child: Text("Sign Up")),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
