import 'package:flutter/material.dart';
import 'package:foodys_app/controller/basket_controller.dart';
import 'package:foodys_app/controller/fav_controller.dart';
import 'package:foodys_app/controller/main_controller.dart';
import 'package:foodys_app/model/products.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:foodys_app/view/screens/category_card_detail_screen.dart';
import 'package:foodys_app/view/utilities_widgets/generic_cached_network_image_widget.dart';
import 'package:foodys_app/view/utilities_widgets/std_text.dart';
import 'package:numeral/numeral.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scoped_model/scoped_model.dart';

///
/// This page is for elements within the category.
///
class GenericCategoryCard extends StatelessWidget {
  final Products products;

  GenericCategoryCard(this.products);

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    double scaleFactor =
        ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: Colors.grey.shade300,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryCardDetailScreen(products),
        )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScopedModel(
                model: MainController.getFavoritesModel(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ScopedModelDescendant<FavController>(
                      builder: (context, child, model) => Container(
                        width: 35 * scaleFactor,
                        height: 20 * scaleFactor,
                        child: InkWell(
                          onTap: () async {
                            model.favProdList.contains(products)
                                ? model.removeFavorites(
                                    products.proId, await prefs)
                                : model.addToFavorites(
                                    products.proId, await prefs);
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 30 * scaleFactor,
                            color: model.favProdList.contains(products)
                                ? Colors.redAccent
                                : Colors.grey,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: genericCachedNetworkImageNetwork(
                  products.proImgUrl,
                  context,
                  imageHeight: 58 * scaleFactor,
                  imageWidth: 75 * scaleFactor,
                ),
              ),
              specialTxtWidget(
                context,
                products.proName,
                12.0,
                topPadding: 8.0,
                leftPadding: 4.0,
                rightPadding: 4.0,
                bottomPadding: 4.0,
                isScale: true,
              ),
              specialTxtWidget(
                context,
                "\$" + Numeral(products.proPrice).format(), //pro
                15.0,
                leftPadding: 4.0,
                weight: FontWeight.bold,
                isScale: false,
              ),
              SizedBox(height: 7.0 * scaleFactor),
              ScopedModel(
                model: MainController.getBasketModel(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ScopedModelDescendant<BasketController>(
                      builder: (context, child, model) => InkWell(
                        onTap: () =>
                            model.addBasket(products.proId, quantity: 1),
                        child: Container(
                          width: 30 * scaleFactor,
                          height: 30 * scaleFactor,
                          child: const Icon(Icons.add_shopping_cart_rounded),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                            ),
                            color: Constants.appColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
