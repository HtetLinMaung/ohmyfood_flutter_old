import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/providers/menu_provider.dart';
import 'package:ohmyfood_flutter/screens/menu_detail_screen.dart';
import 'package:provider/provider.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<MenuProvider>();

    return Expanded(
      child: ListView.builder(
        itemCount: store.menus.length,
        itemBuilder: (ctx, i) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                final store = context.read<MenuProvider>();
                store.setMenuId(store.menus[i].id);
                Navigator.pushNamed(context, MenuDetailScreen.routeName);
              },
              child: Container(
                height: 100,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Hero(
                      tag: 'menu_image${store.menus[i].id}',
                      child: Material(
                        type: MaterialType.transparency,
                        child: RoundedImage(
                          image: AssetImage(store.menus[i].imageUrl),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store.menus[i].name,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              store.menus[i].description,
                              style: TextStyle(
                                fontSize: 12,
                                color: kNormalFontColor,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${store.menus[i].price} kyats',
                              style: TextStyle(
                                fontSize: 16,
                                color: kBlueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleButton(
                          onPress: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          fillColor: kBlueColor,
                          size: 34,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RoundedImage extends StatelessWidget {
  final ImageProvider<Object> image;

  const RoundedImage({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 85,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
