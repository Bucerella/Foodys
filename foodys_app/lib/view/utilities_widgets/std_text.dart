import 'package:flutter/material.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:google_fonts/google_fonts.dart';

Widget specialTxtWidget(
  BuildContext context,
  String txtName,
  double size, {
  FontWeight? weight,
  bool isScale = false,
  double topPadding = 0,
  double leftPadding = 0,
  double rightPadding = 0,
  double bottomPadding = 0,
}) {
  double scaleFactor =
      ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
  return Padding(
    padding: EdgeInsets.only(
      left: leftPadding * scaleFactor,
      top: topPadding * scaleFactor,
      right: rightPadding * scaleFactor,
      bottom: bottomPadding * scaleFactor,
    ),
    child: Text(
      txtName,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
      ),
      textScaleFactor: isScale ? scaleFactor : 1.0,
    ),
  );
}

Widget titleTxtWidget(
  String title,
  double sizeFont,
  Color color,
) {
  return Text(
    title,
    style: GoogleFonts.comfortaa(
      fontSize: sizeFont,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}
