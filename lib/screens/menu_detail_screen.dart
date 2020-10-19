import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/models/cart_item.dart';
import 'package:ohmyfood_flutter/models/menu.dart';
import 'package:ohmyfood_flutter/providers/app_provider.dart';
import 'package:ohmyfood_flutter/providers/menu_provider.dart';
import 'package:ohmyfood_flutter/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class MenuDetailScreen extends StatefulWidget {
  static const routeName = 'MenuDetailScreen';

  @override
  _MenuDetailScreenState createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
    final store = context.watch<MenuProvider>();
    final menu = store.currentMenu;

    if (menu == null) {
      return Container();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: -60,
            top: -90,
            child: Hero(
              tag: "menu_image${menu.id}",
              child: Material(
                type: MaterialType.transparency,
                child: CircleAvatar(
                  radius: 180,
                  backgroundImage: AssetImage(menu.imageUrl),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.close,
                              size: 20,
                            ),
                            onTap: () {
                              menu.ingredients
                                  .forEach((element) => element.quantity = 0);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(''),
                      ),
                      Text(
                        menu.name,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              menu.description,
                              style: TextStyle(
                                color: kNormalFontColor,
                              ),
                            ),
                          ),
                          Text(
                            '${menu.price} kyats',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Card(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                  ),
                  elevation: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 35.0,
                        ),
                        child: Text(
                          'Add more stuff',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemCount: menu.ingredients.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        menu.ingredients[i].name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: kNormalFontColor,
                                        ),
                                      ),
                                      Text(
                                        '${menu.ingredients[i].price} kyats',
                                        style: TextStyle(
                                          color: kNormalFontColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  !menu.ingredients[i].oneOrMore
                                      ? CircleButton(
                                          size: 30,
                                          onPress: () {
                                            setState(() {
                                              menu.ingredients[i].quantity =
                                                  menu.ingredients[i].quantity <
                                                          1
                                                      ? 1
                                                      : 0;
                                            });
                                          },
                                          fillColor:
                                              menu.ingredients[i].quantity == 1
                                                  ? Colors.red
                                                  : kTagColor,
                                          child: Icon(
                                            menu.ingredients[i].quantity == 0
                                                ? Icons.add
                                                : Icons.remove,
                                            size: 16,
                                            color:
                                                menu.ingredients[i].quantity ==
                                                        1
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        )
                                      : Row(
                                          children: [
                                            CircleButton(
                                              size: 25,
                                              onPress: () {
                                                setState(() {
                                                  if (menu.ingredients[i]
                                                          .quantity !=
                                                      0) {
                                                    menu.ingredients[i]
                                                        .quantity--;
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                size: 16,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                menu.ingredients[i].quantity
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            CircleButton(
                                              size: 25,
                                              onPress: () {
                                                setState(() {
                                                  menu.ingredients[i]
                                                      .quantity++;
                                                });
                                              },
                                              child: Icon(
                                                Icons.add,
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(''),
                  ),
                  Expanded(
                    flex: 7,
                    child: MainButton(
                      elevation: 10,
                      onPressed: () {
                        final carts = appProvider.carts;
                        carts.add(CartItem(
                          id: DateTime.now().toIso8601String(),
                          menu: menu.getClone(),
                        ));
                        appProvider.setCarts(carts);

                        menu.ingredients
                            .forEach((element) => element.quantity = 0);
                        Navigator.popAndPushNamed(
                            context, CartScreen.routeName);
                      },
                      color: kDarkYellowColor,
                      title: 'Add to cart',
                    ),
                  ),
                  Expanded(
                    child: Text(''),
                  ),
                  CircleButton(
                    size: 45,
                    onPress: () =>
                        Navigator.pushNamed(context, CartScreen.routeName),
                    elevation: 10,
                    // fillColor: kDarkYellowColor,
                    child: Badge(
                      showBadge: appProvider.carts.length > 0,
                      badgeContent: Text(
                        appProvider.carts.length.toString(),
                      ),
                      badgeColor: kDarkYellowColor,
                      child: Icon(
                        Icons.add_shopping_cart_rounded,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(''),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
