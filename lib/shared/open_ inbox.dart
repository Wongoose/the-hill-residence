import "package:flutter/material.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class OpenInboxScreen extends StatelessWidget {
  final String description;

  const OpenInboxScreen({required this.description});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 32, 35, 22),
          child: Column(
            children: [
              MyPageAppBar(title: "Alert"),
              Expanded(
                child: Container(),
              ),
              Text(
                "Check your inbox!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 39,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    height: 1.1),
              ),
              Expanded(child: Container()),
              Image(
                height: 250,
                width: 250,
                image: AssetImage("assets/images/inbox.png"),
              ),
              SizedBox(height: 35),
              SizedBox(
                width: 250,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Nunito",
                  ),
                ),
              ),
              SizedBox(height: 35),
              SizedBox(
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
                  onPressed: () async {
                    // final OpenMailAppResult result =
                    //     await OpenMailApp.openMailApp();
                    // if (!result.didOpen && !result.canOpen) {
                    //   // If no mail apps found, show error
                    //   toast("Oops! No mail apps installed.");
                    // } else if (!result.didOpen && result.canOpen) {
                    //   showDialog(
                    //     context: context,
                    //     builder: (_) {
                    //       return MailAppPickerDialog(
                    //         mailApps: result.options,
                    //       );
                    //     },
                    //   );
                    // }
                  },
                  child: Text(
                    "Open email app",
                    style: TextStyle(
                      // shadows: [
                      //   Shadow(
                      //       color: Colors.black26,
                      //       blurRadius: 10,
                      //       offset: Offset(0.5, 0.5))
                      // ],
                      fontFamily: "Nunito",
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    "Click to go back to home",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        decoration: TextDecoration.underline,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
