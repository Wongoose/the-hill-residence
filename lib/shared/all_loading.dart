import 'package:flutter/material.dart';

class CircleLoading extends StatelessWidget {
  final double size;

  const CircleLoading({this.size = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size * 15,
      width: size * 15,
      child: CircularProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        strokeWidth: 1,
      ),
    );
  }
}
