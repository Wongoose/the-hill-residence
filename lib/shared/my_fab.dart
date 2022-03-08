import "package:flutter/material.dart";

class MyFAB extends StatelessWidget {
  final Function onPressFunc;
  const MyFAB({required this.onPressFunc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        onPressed: onPressFunc(),
        child: Icon(
          Icons.shopping_cart_checkout_rounded,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
