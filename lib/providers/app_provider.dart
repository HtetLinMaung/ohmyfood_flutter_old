import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/models/cart_item.dart';

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
}
