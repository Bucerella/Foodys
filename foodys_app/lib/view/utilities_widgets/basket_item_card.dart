import 'package:flutter/material.dart';
import 'package:foodys_app/controller/basket_controller.dart';
import 'package:foodys_app/controller/main_controller.dart';
import 'package:foodys_app/model/products.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:foodys_app/view/utilities_widgets/generic_cached_network_image_widget.dart';
import 'package:foodys_app/view/utilities_widgets/std_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeral/numeral.dart';
import 'package:scoped_model/scoped_model.dart';

///
/// This page for basket items page. It seems total price and count items.
///
class BasketItemCard extends StatelessWidget {
  final Products products;

  BasketItemCard(this.products);

  @override
  Widget build(BuildContext context) {
    double scaleFactor =
        ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
    return ScopedModel(
      model: MainController.getBasketModel(),
      child: Column(
        children: [
          SizedBox(height: 8.0 * scaleFactor),
          titleTxtWidget(
            products.proName,
            20.0,
            Colors.black,
          ),
          Container(
            height: 130 * scaleFactor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ScopedModelDescendant<BasketController>(
                  builder: (context, child, model) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => model.addBasket(
                          products.proId,
                          quantity: 1,
                        ),
                        child: Container(
                          width: 24,
                          height: 24,
                          child: const Icon(
                            Icons.add,
                            size: 18,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          model.getProdCount(products.proId).toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            model.deleteInBasket(products.proId, quantity: 1),
                        child: Container(
                          width: 24,
                          height: 24,
                          child: const Icon(
                            Icons.remove,
                            size: 18,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                genericCachedNetworkImageNetwork(
                  products.proImgUrl,
                  context,
                  imageHeight: 75 * scaleFactor,
                  imageWidth: 120 * scaleFactor,
                ),
                ScopedModelDescendant<BasketController>(
                  builder: (context, child, model) => Text(
                    "\$" +
                        Numeral(
                          products.proPrice *
                              model.getProdCount(products.proId),
                        ).format(),
                    style: GoogleFonts.comfortaa(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: scaleFactor,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Constants.appColor,
            thickness: 2,
            indent: 20 * scaleFactor,
            endIndent: 20 * scaleFactor,
          )
        ],
      ),
    );
  }
}
