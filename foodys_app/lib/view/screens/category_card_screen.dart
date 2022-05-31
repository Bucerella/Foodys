import 'package:flutter/material.dart';
import 'package:foodys_app/model/products.dart';
import 'package:foodys_app/utilities/datas.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:foodys_app/view/screens/basket_screen.dart';
import 'package:foodys_app/view/utilities_widgets/basket_card_widget.dart';
import 'package:foodys_app/view/utilities_widgets/generic_category_card.dart';
import 'package:foodys_app/view/utilities_widgets/std_text.dart';

///
/// This page for the Category items screen.
/// If you can click random category, it will go product screen.
/// Than, it will appear category items, all of them.
///
class CategoryCardScreen extends StatelessWidget {
  final int? catId;
  final String? catName;

  CategoryCardScreen({
    this.catId,
    this.catName,
  });

  List<GenericCategoryCard> getProductCardList() {
    List<GenericCategoryCard> productList = [];
    for (Products pro in Datas.productsList) {
      if (pro.proCatId == catId) {
        productList.add(GenericCategoryCard(pro));
      }
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    double scaleFactor =
        ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
    return Scaffold(
      appBar: AppBar(
        title: titleTxtWidget(
          catName ?? "-",
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
          Expanded(
            child: GridView.count(
              childAspectRatio: 0.725,
              primary: false,
              padding: EdgeInsets.only(
                left: 10 * scaleFactor,
                right: 10 * scaleFactor,
                top: 10 * scaleFactor,
              ),
              crossAxisSpacing: 10 * scaleFactor,
              mainAxisSpacing: 10 * scaleFactor,
              crossAxisCount: 2,
              children: getProductCardList(),
            ),
          ),
        ],
      ),
    );
  }
}
