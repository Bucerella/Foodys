import 'package:foodys_app/model/products.dart';
import 'package:foodys_app/utilities/datas.dart';
import 'package:foodys_app/view/utilities_widgets/generic_category_card.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavController extends Model {
  List<GenericCategoryCard> prodCardList = [];
  List<Products> favProdList = [];

  bool favProdListLoaded = false;
  bool favCardLoaded = false;

  Future getFavProductCardList() async {
    if (!favCardLoaded) {
      await getFavProducts();
      if (favProdListLoaded && favProdList.isNotEmpty) {
        prodCardList = [];
        for (Products p in favProdList) {
          prodCardList.add(GenericCategoryCard(p));
        }
        favCardLoaded = true;
        notifyListeners();
      }
    }
  }

  void getLocalFavProductCardList() {
    prodCardList = [];
    if (favProdList.isNotEmpty) {
      for (Products p in favProdList) {
        prodCardList.add(GenericCategoryCard(p));
      }
      notifyListeners();
    }
  }

  List<String> getStringIDList() {
    List<String> favIdList = [];
    for (Products p in favProdList) {
      if (!favIdList.contains(p.proId)) {
        favIdList.add(p.proId.toString());
      }
    }
    return favIdList;
  }

  Future getFavProducts() async {
    if (!favProdListLoaded) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? stringIds = prefs.getStringList('favList');
      if (stringIds != null) {
        for (String pId in stringIds) {
          for (Products product in Datas.productsList) {
            if (int.parse(pId) == product.proId &&
                !favProdList.contains(product)) {
              favProdList.add(product);
            }
          }
        }
      }
      favProdListLoaded = true;
      notifyListeners();
    }
  }
  Future addToFavorites(int productId, SharedPreferences prefs) async {
    for (Products p in Datas.productsList) {
      if (p.proId == productId && !favProdList.contains(p)) {
        favProdList.add(p);
        break;
      }
    }
    await prefs.setStringList("favList", getStringIDList());
    getLocalFavProductCardList();
    notifyListeners();
  }

  Future removeFavorites(int productId, SharedPreferences prefs) async {
    for (Products pro in Datas.productsList) {
      if (pro.proId == productId) {
        favProdList.remove(pro);
        break;
      }
    }
    await prefs.setStringList("favList", getStringIDList());
    getLocalFavProductCardList();
    notifyListeners();
  }
}
