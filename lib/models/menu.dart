import 'package:ohmyfood_flutter/models/menu_type.dart';

class Menu {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discountPercent;
  final String imageUrl;
  final List<MenuType> menuType;

  Menu({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discountPercent,
    this.imageUrl,
    this.menuType,
  });
}
