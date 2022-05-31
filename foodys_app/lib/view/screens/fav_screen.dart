import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodys_app/controller/fav_controller.dart';
import 'package:foodys_app/controller/main_controller.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:foodys_app/view/utilities_widgets/std_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';

///
/// This page for the Favourite Items.
/// It will see favourite items, if you not have it seems empty card and information message.
///
class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scaleFactor =
        ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
    return Scaffold(
      appBar: AppBar(
        title: titleTxtWidget(
          Constants.fav,
          20,
          Colors.white,
        ),
        backgroundColor: Constants.appColor,
      ),
      body: ScopedModel(
        model: MainController.getFavoritesModel(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScopedModelDescendant<FavController>(
              builder: (context, child, model) {
                return model.prodCardList.isNotEmpty
                    ? Expanded(
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
                            children: model.prodCardList),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtilities.getScreenHeight(context) / 3.5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Constants.emptyImg,
                              width: 100 * scaleFactor,
                              height: 100 * scaleFactor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16 * scaleFactor,
                                  right: 16 * scaleFactor),
                              child: Text(
                                Constants.searchMessage,
                                style: GoogleFonts.comfortaa(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.center,
                                textScaleFactor: scaleFactor,
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
