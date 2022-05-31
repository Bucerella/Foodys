import 'package:flutter/material.dart';
import 'package:foodys_app/utilities/utilities.dart';


///
/// Bottom navbar widgets
///
List<BottomNavigationBarItem> navbarItems = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      key: Key('Home'),

      /// This key for testing
    ),
    label: Constants.home,
  ),
  const BottomNavigationBarItem(
    //icon: BasketCardWidget(),
    icon: Icon(
      Icons.shopping_cart,
      key: Key('Cart'),
    ),
    label: Constants.cart,
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.favorite,
      key: Key('Fav'),

      /// This key for testing
    ),
    label: Constants.fav,
  ),
];
