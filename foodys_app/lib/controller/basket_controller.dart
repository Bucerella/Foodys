import 'package:foodys_app/model/products.dart';
import 'package:foodys_app/utilities/datas.dart';
import 'package:scoped_model/scoped_model.dart';

class BasketController extends Model {
  Map<Products, int> prodMap = {};

  void addBasket(int prodID, {int quantity = 1}) {
    if (prodMap.keys.contains(getProdId(prodID))) {
      prodMap[getProdId(prodID)] = quantity + 1;
    } else {
      prodMap[getProdId(prodID)] = quantity;
    }
    notifyListeners();
  }

  void deleteInBasket(int prodID, {int quantity = 1}) {
    if (prodMap.keys.contains(getProdId(prodID))) {
      if (prodMap[getProdId(prodID)]! > 1) {
        prodMap[getProdId(prodID)] = 0; //-1
      } else {
        prodMap.remove(getProdId(prodID));
      }
    }
    notifyListeners();
  }

  getProdCount(int prodID) {
    if (prodMap.keys.contains(getProdId(prodID))) {
      return prodMap[getProdId(prodID)];
    } else {
      return 1;
    }
  }

  getProdId(int id) {
    for (Products p in Datas.productsList) {
      if (p.proId == id) {
        return p;
      }
    }
  }

  double getTotalPriceMarket() {
    double totalPrice = 0;
    for (Products key in prodMap.keys) {
      totalPrice = prodMap[key]! * key.proPrice;
    }
    return totalPrice;
  }

  int getTotalBasketCount() {
    int totalQuantity = 0;
    int tempCount = 0;
    for (Products key in prodMap.keys) {
      tempCount = prodMap[key]! + 1;
      totalQuantity = tempCount;
    }
    return totalQuantity;
  }

  void deleteAllBasket() {
    prodMap.clear();
    notifyListeners();
  }
}
