import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/shared/my_profile_item.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "package:the_hill_residence/widgets/profile_user_card.dart";

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Padding(
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
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        shape: BoxShape.circle,
                      ),
                      // height: MediaQuery.of(context).size.height - 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100000)),
                        child: Image(
                          height: 80,
                          image: AssetImage("assets/images/face.png"),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Tom Wong",
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
                    ProfileUserCard(),
                    SizedBox(height: 15),
                    MyProfileItem(
                      itemIcon: Icons.person,
                      text: "Account name",
                      onPressed: navigateToEditUsername,
                    ),
                    SizedBox(height: 15),
                    MyProfileItem(
                      itemIcon: Icons.email_rounded,
                      text: "Email",
                      onPressed: navigateToEditEmail,
                    ),
                    SizedBox(height: 15),
                    MyProfileItem(
                      itemIcon: Icons.house,
                      text: "Address",
                      onPressed: navigateToEditAddress,
                    ),
                    SizedBox(height: 15),
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
                    GestureDetector(
                      onTap: () => navigateToSettingsMain(),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
