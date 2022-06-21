import "package:flutter/material.dart";
import "package:the_hill_residence/screens/settings/widgets/faq_item.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";

class SettingsFAQPage extends StatelessWidget {
  final List<List<String>> faqList = [
    ["Example questions?", "Example descriptions..."],
    ["What is this app about?", "Lorem ipsum"],
    ["How do I register a new visitor?", "Lorem ipsum"],
    ["Why does the app require my phone number?", "Lorem ipsum"],
  ];
  SettingsFAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
            child: Column(
              children: [
                MyPageAppBar(
                    title: "FAQ, Support", appBarType: MyAppBarType.xmark),
                SizedBox(height: 40),
                Expanded(
                  child: ListView.separated(
                    itemCount: faqList.length,
                    itemBuilder: (context, i) => FAQItem(
                      question: faqList[i][0],
                      description: faqList[i][1],
                    ),
                    separatorBuilder: (context, i) => SizedBox(height: 15),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
