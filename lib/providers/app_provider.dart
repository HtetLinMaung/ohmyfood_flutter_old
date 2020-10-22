import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/models/cart_item.dart';
import 'package:ohmyfood_flutter/models/menu.dart';

class AppProvider with ChangeNotifier {
  List<CartItem> _carts = [];

  List<CartItem> get carts => _carts;

  double get subTotal => _carts.length > 0
      ? _carts
          .map((e) => e.getTotal() * e.quantity)
          .toList()
          .reduce((value, element) => value + element)
      : 0;

  double get discountPrice => 0;

  void setCarts(List<CartItem> carts) {
    _carts = carts.where((element) => element.quantity > 0).toList();
    notifyListeners();
  }

  void addToCart(Menu menu) {
    var found = true;
    final index = carts.indexWhere((element) => element.menu.id == menu.id);
    if (index >= 0) {
      for (var cartIngredient in carts[index].menu.ingredients) {
        var i = menu.ingredients
            .indexWhere((element) => element.id == cartIngredient.id);
        if (i == -1) {
          found = false;
          break;
        } else {
          if (cartIngredient.quantity != menu.ingredients[i].quantity) {
            found = false;
            break;
          }
        }
      }
    } else {
      found = false;
    }
    if (found) {
      carts[index].quantity++;
    } else {
      carts.add(CartItem(
        id: DateTime.now().toIso8601String(),
        menu: menu.getClone(),
      ));
    }
    notifyListeners();
  }
}
