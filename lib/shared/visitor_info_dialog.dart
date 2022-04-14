import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class VisitorInfoDialog extends StatelessWidget {
  const VisitorInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 60),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(32, 32, 32, 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Visitor's info",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 25),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        height: 80,
                        width: 80,
                        image: AssetImage("assets/images/face.png"),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Divider(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 14,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  "+6016-331 5288",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black.withOpacity(0.7),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.calendar,
                                  size: 14,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  "20th Apr 2022",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black.withOpacity(0.7),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.bookmark_add_outlined,
                          size: 28,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.transparent,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: -20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.withOpacity(0.1),
                ),
                // circular profile picture inside
                child: Image(
                  image: AssetImage("assets/images/arrived-darkblue.png"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
