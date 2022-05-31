import 'package:flutter/material.dart';

class Constants {
  /// App Text Constants
  static const String myBasket = "My Basket";
  static const String home = "Home";
  static const String cart = "Cart";
  static const String done = "Done";
  static const String yes = "Yes";
  static const String no = "No";
  static const String totalPrice = "Total Price: ";
  static const String areYouSureMsg =
      "All basket items will be delete, are you sure?";
  static const String confirmOrder = "Confirm Order";
  static const String fav = "Favourites";
  static const String categoryScreen = "Categories Screen";
  static const String welcomeMessage = "Welcome to Foody!";
  static const String searchMessage =
      "Search our products to find and add what you like, please";
  static const String success = "Success!";
  static const String orderSuccess = "Your order has been completed...";

  /// Image constants
  static const String foodImg = "assets/foods.png";
  static const String cooking2Img = "assets/cooking2.jpeg";
  static const String cooking3Img = "assets/cooking3.jpeg";
  static const String editedGif = "assets/edited.gif";
  static const String emptyImg = "assets/empty.png";

  static const Color appColor = Color(0xffffb80e);
}

class ScreenUtilities {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenHeight(BuildContext context) {
    return getScreenSize(context).height;
  }

  static double getScreenWidth(BuildContext context) {
    return getScreenSize(context).width;
  }

  static double pWidth = 286.176;
}
