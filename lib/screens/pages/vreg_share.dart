import "package:flutter/material.dart";

class VRegShare extends StatelessWidget {
  const VRegShare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wohoo",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Registration complete!",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                alignment: Alignment.center,
                // height: MediaQuery.of(context).size.height - 100,
                child: Image(
                  height: 250,
                  image: AssetImage("assets/images/social-media.png"),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Share it!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nunito",
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Don't forget to send the entry key to your visitor. He/she'll need it later.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Nunito",
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () async {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.whatsapp, size: 38),
                            SizedBox(width: 10),
                            Text(
                              "Send via WhatsApp",
                              style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //       color: _themeProvider.primaryTextColor26,
                                //       blurRadius: 10,
                                //       offset: Offset(0.5, 0.5))
                                // ],
                                fontFamily: "Nunito Sans",
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      onPressed: () async {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          "Or use another app",
                          style: TextStyle(
                            // shadows: [
                            //   Shadow(
                            //       color: _themeProvider.primaryTextColor26,
                            //       blurRadius: 10,
                            //       offset: Offset(0.5, 0.5))
                            // ],
                            fontFamily: "Nunito Sans",
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      )),
                ),
              ),

              Expanded(
                child: Container(),
              ),
              // Row - Next button
            ],
          ),
        ),
      ),
    );
  }
}
