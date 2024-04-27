import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text1;
  Color textColor, backgroundColor;
  double horizontal, vertical, width, borderRadius;
  VoidCallback move;
  Button(
      {super.key,
      required this.text1,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.blue,
      required this.move,
      required this.horizontal,
      required this.vertical,
      required this.width,
      this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 10,
              shadowColor: Colors.black,
              backgroundColor: backgroundColor,
              padding: EdgeInsets.symmetric(
                  horizontal: horizontal, vertical: vertical),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius))),
          onPressed: move,
          child: Text(
            text1,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}
