import 'package:flutter/material.dart';
import 'package:foodys_app/controller/main_controller.dart';
import 'package:foodys_app/view/screens/basket_screen.dart';
import 'package:foodys_app/view/screens/home_category_screen.dart';
import 'package:foodys_app/view/screens/fav_screen.dart';
import 'package:foodys_app/view/utilities_widgets/navbar_items.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatelessWidget {
  MainController mainController = MainController();

  List<Widget> pages = [
    HomeCategoryScreen(),
    BasketScreen(),
    FavScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: mainController,
      child: Scaffold(
        body: ScopedModelDescendant<MainController>(
          builder: (context, child, model) => pages[model.getSelectedIndex()],
        ),
        bottomNavigationBar: ScopedModelDescendant<MainController>(
          builder: (context, child, model) {
            return BottomNavigationBar(
              items: navbarItems,
              currentIndex: model.getSelectedIndex(),
              selectedItemColor: Colors.redAccent,
              onTap: (int i) {
                model.onItemTapped(i);
              },
            );
          },
        ),
      ),
    );
  }
}
