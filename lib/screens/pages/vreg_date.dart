import "package:flutter/material.dart";
import "package:the_hill_residence/screens/pages/vreg_share.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_registration_fab.dart";
import "package:the_hill_residence/widgets/vreg_center_display.dart";

import '../../packages/my_date_picker/datepicker_theme.dart';
import '../../packages/my_date_picker/my_datepicker_widget.dart';

class VRegDate extends StatelessWidget {
  const VRegDate({Key? key}) : super(key: key);

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
              MyPageAppBar(
                  title: "Visitor registration", appBarType: MyAppBarType.back),
              Expanded(
                child: Container(),
              ),
              VRegCenterImageText(
                imagePath: "assets/images/calendar-cropped.png",
                title: "Entry date",
                description: "When is your visitor's date of entry?",
              ),

              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: DatePickerWidget(
                  looping: false, // default is not looping
                  firstDate: DateTime.now(), //DateTime(1960),
                  //  lastDate: DateTime(2002, 1, 1),
//              initialDate: DateTime.now(),// DateTime(1994),
                  dateFormat:
                      // "MM-dd(E)",
                      "dd/MMMM/yyyy",
                  //     locale: DatePicker.localeFromString('he'),
                  onChange: (DateTime newDate, _) {},
                  pickerTheme: DateTimePickerTheme(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    itemTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Nunito"),
                    dividerColor:
                        Theme.of(context).primaryColor.withOpacity(0.8),
                  ),
                ),
              ),

              Expanded(
                child: Container(),
              ),
              SizedBox(height: 30, width: 50),
              // Row - Next button
            ],
          ),
        ),
        floatingActionButton: MyRegFAB(
          navToWidget: VRegShare(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
