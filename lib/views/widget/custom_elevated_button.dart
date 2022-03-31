import '../../views/variables/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? buttonName;
  final void Function()? onPressed;
  final Color? primaryColor;
  final Color? textColor;

  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final Size? fizedSize;
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.buttonName,
    this.fizedSize,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
    this.topPadding = 15.0,
    this.bottomPadding = 15.0,
    this.leftMargin = 30.0,
    this.rightMargin = 30.0,
    this.topMargin = 5.0,
    this.bottomMargin = 5.0,
    this.primaryColor = secondaryColor,
    this.textColor = whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(leftMargin, topMargin, rightMargin, bottomMargin),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: ElevatedButton(
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  leftPadding, topPadding, rightPadding, bottomPadding),
              child: Text(
                "$buttonName",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ),
          ),
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
            // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            fixedSize: fizedSize,
            // textStyle:
            //     TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: white),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)), // <-- Radius
            ),
          ),
        ),
      ),
    );
  }
}
