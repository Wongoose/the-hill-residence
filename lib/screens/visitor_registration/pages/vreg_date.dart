import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:the_hill_residence/controllers/visitor_registration_controller.dart";
import "package:the_hill_residence/shared/my_page_appbar.dart";
import "package:the_hill_residence/shared/my_registration_fab.dart";
import "package:the_hill_residence/utilities/navigation.dart";
import "package:the_hill_residence/screens/visitor_registration/widgets/vreg_center_display.dart";
import "../../../packages/my_date_picker/datepicker_theme.dart";
import "../../../packages/my_date_picker/my_datepicker_widget.dart";

class VRegDate extends StatefulWidget {
  const VRegDate({Key? key}) : super(key: key);
  @override
  State<VRegDate> createState() => _VRegDateState();
}

class _VRegDateState extends State<VRegDate> {
  final DateTime today = DateTime.now();
  final VRegController vRegController = Get.find<VRegController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    MyPageAppBar(title: "Visitor registration", appBarType: MyAppBarType.back),
                    Expanded(child: Container()),
                    VRegCenterImageText(
                        imagePath: "assets/images/calendar-cropped.png",
                        title: "Entry date",
                        description: "When is your visitor arriving?"),
                    // SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: DatePickerWidget(
                            key: ValueKey<DateTime>(vRegController.entryDate.value),
                            onChange: (DateTime selection, _) => vRegController.entryDate.value = selection,
                            looping: false, // default is not looping
                            firstDate: today, //DateTime(1960),
                            lastDate: today.add(Duration(days: 90)),
                            initialDate: vRegController.entryDate.value,
                            dateFormat: "dd/MMMM/yyyy",
                            pickerTheme: DateTimePickerTheme(
                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                itemTextStyle: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Nunito"),
                                dividerColor: Theme.of(context).primaryColor.withOpacity(0.8)))),
                    // SizedBox(height: 20),
                    // <- UPDATE: Add exitDate text here
                    GestureDetector(
                      onTap: () async {
                        showDatePicker(
                          context: context,
                          initialDate: vRegController.entryDate.value,
                          firstDate: today,
                          lastDate: today.add(Duration(days: 90)),
                        ).then((selection) {
                          setState(() {
                            selection != null ? vRegController.entryDate.value = selection : null;
                          });
                        });
                      },
                      child: Text(
                        "Select dates from calendar",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),

                    Expanded(child: Container()),
                    SizedBox(height: 30, width: 50),
                    // Row - Next button
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: MyRegFAB(onPressed: navigateToVRegExitDate),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
