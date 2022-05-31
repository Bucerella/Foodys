import 'package:flutter/material.dart';
import 'package:foodys_app/controller/basket_controller.dart';
import 'package:foodys_app/controller/main_controller.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:scoped_model/scoped_model.dart';


///
/// This widget is for count items. It seems in the corner, items count.
/// If you add the item, it will change count.
///
class BasketCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scaleFactor =
        ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
    return ScopedModel(
      model: MainController.getBasketModel(),
      child: ScopedModelDescendant<BasketController>(
        builder: (context, child, model) => model.getTotalBasketCount() > 0
            ? Center(
                child: Container(
                  width: 32 * scaleFactor,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4.0 * scaleFactor),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 25 * scaleFactor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 15 * scaleFactor,
                          height: 15 * scaleFactor,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.appColor,
                          ),
                          child: Center(
                            child: Text(
                              model.getTotalBasketCount().toString(),
                              style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: scaleFactor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Icon(
                Icons.shopping_cart,
                size: 25 * scaleFactor,
              ),
      ),
    );
  }
}
