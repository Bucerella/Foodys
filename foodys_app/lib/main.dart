import 'package:flutter/material.dart';
import 'package:foodys_app/utilities/utilities.dart';

import 'view/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(primaryColor: Constants.appColor),
    ),
  );
}
