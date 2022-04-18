import "package:flutter/material.dart";

class SettingsSquareItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Function? onPressedFunc;

  const SettingsSquareItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      this.onPressedFunc});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: GestureDetector(
          onTap: () => onPressedFunc!(),
          child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xfff6fbfd),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        // color: Theme.of(context)
                        //     .scaffoldBackgroundColor,
                        border: Border.all(
                          color: Colors.black12,
                          width: 0.5,
                        ),
                      ),
                      child: Icon(
                        icon,
                        color: Theme.of(context).primaryColor,
                        // size: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
