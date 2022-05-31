import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodys_app/controller/main_controller.dart';
import 'package:foodys_app/model/categories.dart';
import 'package:foodys_app/utilities/datas.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:foodys_app/view/utilities_widgets/home_screen_category_card.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// This screen for the Category Screen. It will appear in the HOME SCREEN.
///
class HomeCategoryScreen extends StatelessWidget {
  final MainController mainController = MainController();

  List<Widget> returnCategoryCardList() {
    List<HomeScreenCategoryCard> catList = [];
    for (Categories cat in Datas.categoryList) {
      catList.add(HomeScreenCategoryCard(cat));
    }
    return catList;
  }

  List<Widget> imagesHome = [
    Image.asset(Constants.foodImg),
    Image.asset(Constants.cooking2Img),
    Image.asset(Constants.cooking3Img),
  ];

  @override
  Widget build(BuildContext context) {
    double scaleFactor =
        ScreenUtilities.getScreenWidth(context) / ScreenUtilities.pWidth;
    MainController.getFavoritesModel().getFavProductCardList();
    return ScopedModel(
      model: mainController,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 25.0 * scaleFactor,
                bottom: 16.0 * scaleFactor,
                right: 8.0 * scaleFactor,
                left: 8.0 * scaleFactor,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  color: Colors.amberAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Center(
                    child: Text(
                      Constants.welcomeMessage,
                      style: GoogleFonts.comfortaa(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      textScaleFactor: scaleFactor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16 * scaleFactor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200 * scaleFactor,
                    child: Swiper(
                      curve: Curves.linear,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(child: imagesHome[index]);
                      },
                      itemCount: imagesHome.length,
                      pagination: const SwiperPagination(
                        builder: SwiperPagination.dots,
                        margin: EdgeInsets.all(5),
                      ),
                      control: const SwiperControl(size: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.0 * scaleFactor,
                      left: 8 * scaleFactor,
                    ),
                    child: Text(
                      Constants.categoryScreen,
                      style: GoogleFonts.comfortaa(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      textScaleFactor: scaleFactor,
                    ),
                  ),
                  Divider(
                    color: Constants.appColor,
                    thickness: 2,
                    indent: 10 * scaleFactor,
                    endIndent: 24 * scaleFactor,
                  )
                ],
              ),
            ),
            GridView.count(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(20 * scaleFactor),
              crossAxisSpacing: 10 * scaleFactor,
              mainAxisSpacing: 10 * scaleFactor,
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              children: returnCategoryCardList(),
            ),
          ],
        ),
      ),
    );
  }
}
