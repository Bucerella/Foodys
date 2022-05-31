import 'package:flutter/material.dart';
import 'package:foodys_app/model/categories.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:foodys_app/view/screens/category_card_screen.dart';
import 'package:foodys_app/view/utilities_widgets/generic_cached_network_image_widget.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// This page for the home screen category cards.
///
class HomeScreenCategoryCard extends StatelessWidget {
  final Categories categories;

  HomeScreenCategoryCard(this.categories);

  @override
  Widget build(BuildContext context) {
    double scaleFactor =
        ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryCardScreen(
            catId: categories.catId,
            catName: categories.catName,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8 * scaleFactor),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.2, color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            genericCachedNetworkImageNetwork(
              categories.catImgUrl,
              context,
              imageHeight: 70 * scaleFactor,
              imageWidth: 100 * scaleFactor,
            ),
            Text(
              categories.catName,
              style: GoogleFonts.comfortaa(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              textScaleFactor: scaleFactor,
            ),
          ],
        ),
        //color: Colors.teal[100],
      ),
    );
  }
}
