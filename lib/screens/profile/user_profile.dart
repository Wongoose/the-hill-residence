import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

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
                        CupertinoIcons.xmark,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text(
                    "My profile",
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
              SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                // height: MediaQuery.of(context).size.height - 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100000)),
                  child: Image(
                    height: 100,
                    image: AssetImage("assets/images/astronaut.jpg"),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Zheng Xiang",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Administrator",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Divider(height: 60, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            // circular profile picture inside
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(
                                image: AssetImage(
                                    "assets/icons/the-hill-icon.png"),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lot 501",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  "2 users",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Icon(
                      CupertinoIcons.add,
                      color: Colors.black54,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFe7f4f8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      // CupertinoIcons.person,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Personal info",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFe7f4f8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Security",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFe7f4f8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.verified_user_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Access",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Text(
                "Looking for something else?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
