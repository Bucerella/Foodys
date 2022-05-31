import 'package:foodys_app/controller/basket_controller.dart';
import 'package:foodys_app/controller/fav_controller.dart';
import 'package:scoped_model/scoped_model.dart';

class MainController extends Model {
  static BasketController? basketController;
  static FavController? favController;
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int getSelectedIndex() {
    return _selectedIndex;
  }

  static BasketController getBasketModel() {
    return basketController = basketController ?? BasketController();
  }

  static FavController getFavoritesModel() {
    return favController = favController ?? FavController();
  }
}
