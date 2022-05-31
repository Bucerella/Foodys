import 'package:flutter/material.dart';
import 'package:foodys_app/controller/basket_controller.dart';
import 'package:foodys_app/controller/main_controller.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:foodys_app/view/utilities_widgets/basket_item_card.dart';
import 'package:foodys_app/view/utilities_widgets/std_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';

///
/// This page for the basket side. It will see items inside basket.
/// If you want order or delete items.
///
class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scaleFactor =
        ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
    return ScopedModel(
      model: MainController.getBasketModel(),
      child: Scaffold(
        appBar: AppBar(
          title: titleTxtWidget(
            Constants.myBasket,
            20,
            Colors.white,
          ),
          actions: [
            ScopedModelDescendant<BasketController>(
              builder: (context, child, model) => IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => showDeleteDialog(context, model),
              ),
            )
          ],
          backgroundColor: Constants.appColor,
        ),
        body: ScopedModelDescendant<BasketController>(
          builder: (context, child, model) => model.prodMap.keys.isNotEmpty
              ? Stack(
                  children: [
                    ListView.builder(
                        itemCount: model.prodMap.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BasketItemCard(
                            model.prodMap.keys.elementAt(index),
                          );
                        }),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Container(
                            width: ScreenUtilities.getScreenWidth(context) / 2,
                            height: 50 * scaleFactor,
                            color: Constants.appColor,
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: Constants.totalPrice,
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "\$" +
                                          model
                                              .getTotalPriceMarket()
                                              .toStringAsFixed(2),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                textScaleFactor: scaleFactor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => showSuccessDialog(context, model),
                            child: Container(
                              width:
                                  ScreenUtilities.getScreenWidth(context) / 2,
                              height: 50 * scaleFactor,
                              child: Center(
                                child: Text(
                                  Constants.confirmOrder,
                                  style: GoogleFonts.comfortaa(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Image.asset(
                    Constants.emptyImg,
                    width: 200 * scaleFactor,
                    height: 200 * scaleFactor,
                  ),
                ),
        ),
      ),
    );
  }

  void showSuccessDialog(BuildContext context, BasketController model) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            MaterialButton(
              color: Constants.appColor,
              child: Text(
                Constants.done,
                style: GoogleFonts.comfortaa(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                model.deleteAllBasket();
              },
            ),
          ],
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.done_all,
                color: Constants.appColor,
                size: ScreenUtilities.getScreenWidth(context) / 6,
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  Constants.success,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                Constants.orderSuccess,
                textAlign: TextAlign.center,
                style: GoogleFonts.comfortaa(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context, BasketController model) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            MaterialButton(
              color: Constants.appColor,
              child: Text(
                Constants.yes,
                style: GoogleFonts.comfortaa(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                model.deleteAllBasket();
              },
            ),
            MaterialButton(
              color: Colors.redAccent,
              child: Text(
                Constants.no,
                style: GoogleFonts.comfortaa(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.announcement_rounded,
                color: Colors.redAccent,
                size: ScreenUtilities.getScreenWidth(context) / 6,
              ),
              const SizedBox(height: 8.0),
              Text(
                Constants.areYouSureMsg,
                textAlign: TextAlign.center,
                style: GoogleFonts.comfortaa(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
