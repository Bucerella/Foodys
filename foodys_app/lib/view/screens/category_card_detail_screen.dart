import 'package:flutter/material.dart';
import 'package:foodys_app/controller/basket_controller.dart';
import 'package:foodys_app/controller/fav_controller.dart';
import 'package:foodys_app/controller/main_controller.dart';
import 'package:foodys_app/model/products.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:foodys_app/view/screens/basket_screen.dart';
import 'package:foodys_app/view/utilities_widgets/basket_card_widget.dart';
import 'package:foodys_app/view/utilities_widgets/generic_cached_network_image_widget.dart';
import 'package:foodys_app/view/utilities_widgets/std_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scoped_model/scoped_model.dart';

///
/// This page for the category product detail.
/// If you can go category inside, than click random item -> it will go Product Detail screen.
///
class CategoryCardDetailScreen extends StatelessWidget {
  final Products products;
  Future<SharedPreferences> sharedPref = SharedPreferences.getInstance();

  CategoryCardDetailScreen(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scaleFactor =
        ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
    return Scaffold(
      appBar: AppBar(
        title: titleTxtWidget(
          products.proName,
          20,
          Colors.white,
        ),
        actions: [
          IconButton(
            icon: BasketCardWidget(),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BasketScreen(),
              ),
            ),
          )
        ],
        backgroundColor: Constants.appColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: genericCachedNetworkImageNetwork(
              products.proImgUrl,
              context,
              imageHeight: 180 * scaleFactor,
              imageWidth: 160 * scaleFactor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.0 * scaleFactor,
              top: 8.0 * scaleFactor,
            ),
            child: Text(
              products.proName,
              style: const TextStyle(fontSize: 18),
              textScaleFactor: scaleFactor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.0 * scaleFactor,
              right: 20.0 * scaleFactor,
              top: 8.0 * scaleFactor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$" + products.proPrice.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textScaleFactor: scaleFactor,
                ),
                ScopedModel(
                  model: MainController.getBasketModel(),
                  child: ScopedModelDescendant<BasketController>(
                    builder: (context, child, model) => Row(
                      children: [
                        InkWell(
                          onTap: () => model.deleteInBasket(products.proId),
                          child: Container(
                            width: 30 * scaleFactor,
                            height: 30 * scaleFactor,
                            decoration: BoxDecoration(
                                color: Constants.appColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(Icons.remove),
                          ),
                        ),
                        specialTxtWidget(
                          context,
                          model.getProdCount(products.proId).toString(),
                          16.0,
                          leftPadding: 8.0,
                          rightPadding: 8.0,
                          isScale: true,
                          weight: FontWeight.bold,
                        ),
                        InkWell(
                          onTap: () => model.addBasket(products.proId),
                          child: Container(
                            width: 30 * scaleFactor,
                            height: 30 * scaleFactor,
                            decoration: BoxDecoration(
                                color: Constants.appColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          specialTxtWidget(
            context,
            products.proDesc,
            16.0,
            topPadding: 20.0,
            leftPadding: 20.0,
            rightPadding: 20.0,
            isScale: true,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8.0 * scaleFactor,
              right: 12.0 * scaleFactor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 45 * scaleFactor,
                  height: 45 * scaleFactor,
                  child: ScopedModel(
                    model: MainController.getFavoritesModel(),
                    child: ScopedModelDescendant<FavController>(
                      builder: (context, child, model) => InkWell(
                        borderRadius: BorderRadius.circular(45),
                        onTap: () async {
                          model.favProdList.contains(products)
                              ? model.removeFavorites(
                                  products.proId, await sharedPref)
                              : model.addToFavorites(
                                  products.proId, await sharedPref);
                        },
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            size: 40 * scaleFactor,
                            color: model.favProdList.contains(products)
                                ? Colors.redAccent
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
