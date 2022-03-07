import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:the_hill_residence/screens/pages/vreg_date.dart';
import "package:the_hill_residence/widgets/textbox.dart";

class VRegContact extends StatelessWidget {
  const VRegContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black26,
                          width: 0.5,
                        ),
                      ),
                      child: Icon(
                        CupertinoIcons.back,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text(
                    "Visitor registration",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 25,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                alignment: Alignment.center,
                // height: MediaQuery.of(context).size.height - 100,
                child: Image(
                  height: 250,
                  image: AssetImage("assets/images/anonymous_3.png"),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Visitor info",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nunito",
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Select a visitor's phone from your contacts",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Nunito",
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: VRegTextField(hintText: "Phone"),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: VRegTextField(hintText: "Name"),
              ),
              Expanded(
                child: Container(),
              ),
              SizedBox(height: 50, width: 50),
              // Row - Next button
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(10),
          child: FloatingActionButton(
            clipBehavior: Clip.antiAlias,
            elevation: 2.0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
              child: Icon(CupertinoIcons.forward, size: 25),
            ),
            backgroundColor: Color(0xff41aea9),
            foregroundColor: Colors.blueGrey[50],
            onPressed: () {
              Get.to(() => VRegDate());
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
