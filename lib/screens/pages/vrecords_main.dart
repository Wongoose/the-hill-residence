import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class VRecordsMain extends StatelessWidget {
  const VRecordsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 0, 0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 27, 0),
                child: Row(
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
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue[200],
                      ),
                      // circular profile picture inside
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage("assets/images/astronaut.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Visitor records",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).splashColor,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  // padding: EdgeInsets.fromLTRB(30, 40, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1.5,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(30, 40, 10, 40),
                    itemCount: 20,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200],
                            ),
                            // circular profile picture inside
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(
                                image:
                                    AssetImage("assets/images/astronaut.jpg"),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (index % 2 == 0) ? "Robert" : "Jane",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${(index % 4 == 0) ? "Arrived" : "Registered"} - Sep 10, 2021",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 50);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
