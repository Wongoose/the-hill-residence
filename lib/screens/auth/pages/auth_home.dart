import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/screens/auth/pages/auth_sign_in.dart";
import "package:the_hill_residence/screens/auth/pages/auth_sign_up.dart";
import "package:the_hill_residence/screens/home/home.dart";
import "package:the_hill_residence/controllers/theme_service_controller.dart";

class AuthHome extends StatelessWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.to(() => Home()),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    // height: MediaQuery.of(context).size.height - 100,
                    child: Image(
                      image: AssetImage("assets/icons/the-hill-icon.png"),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    themeService.switchTheme();
                  },
                  child: Text(
                    "The-Hill",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                      color: themeService.textColor,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Simple · Convenient · Secure",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Nunito",
                    color: themeService.textColor,
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
                        onPressed: () => Get.to(() => AuthSignIn()),
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
                        onPressed: () => Get.to(() => AuthSignUp()),
                        child: Text("Sign up")),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
