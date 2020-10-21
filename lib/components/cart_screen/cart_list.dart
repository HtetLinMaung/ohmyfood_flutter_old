import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/components/menu_screen/menu_list.dart';
import 'package:ohmyfood_flutter/providers/app_provider.dart';
import 'package:ohmyfood_flutter/providers/menu_provider.dart';
import 'package:ohmyfood_flutter/screens/menu_detail_screen.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
    final carts = appProvider.carts;

    return Expanded(
      flex: 2,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        itemCount: carts.length,
        itemBuilder: (ctx, i) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(
              vertical: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                // final menuProvider = context.read<MenuProvider>();
                // final menus = menuProvider.menus;
                // menuProvider.setMenus(menus.map((e) {
                //   if (e.id == carts[i].id) {
                //     menuProvider.setMenuId(e.id);
                //     return carts[i].menu;
                //   }
                //   return e;
                // }).toList());
                // Navigator.popAndPushNamed(context, MenuDetailScreen.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 85,
                  child: Row(
                    children: [
                      RoundedImage(
                        image: AssetImage(carts[i].menu.imageUrl),
                      ),
                      Expanded(
                        child: Container(
                          height: 85,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    carts[i].menu.name,
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${carts[i].getTotal() * carts[i].quantity} kyats',
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        children: carts[i]
                                            .menu
                                            .ingredients
                                            .where((element) =>
                                                element.quantity > 0)
                                            .toList()
                                            .map((e) => Text(
                                                  'x${e.quantity} ${e.name} ',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            CircleButton(
                                              size: 25,
                                              onPress: () {
                                                final appProvider =
                                                    context.read<AppProvider>();
                                                appProvider
                                                    .setCarts(carts.map((e) {
                                                  if (carts[i].id == e.id &&
                                                      e.quantity != 0) {
                                                    e.quantity--;
                                                  }
                                                  return e;
                                                }).toList());
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
                                                carts[i].quantity.toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            CircleButton(
                                              size: 25,
                                              onPress: () {
                                                final appProvider =
                                                    context.read<AppProvider>();
                                                appProvider
                                                    .setCarts(carts.map((e) {
                                                  if (carts[i].id == e.id) {
                                                    e.quantity++;
                                                  }
                                                  return e;
                                                }).toList());
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
