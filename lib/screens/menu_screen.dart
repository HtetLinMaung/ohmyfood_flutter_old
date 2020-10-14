import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/models/category.dart';
import 'package:ohmyfood_flutter/models/menu.dart';
import 'package:ohmyfood_flutter/models/menu_type.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = 'MenuScreen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<MenuType> _menuTypes = [
    MenuType(
      name: 'Breakfasts',
      active: true,
    ),
    MenuType(
      name: 'Main dishes',
    ),
    MenuType(
      name: 'Desserts',
    ),
  ];
  List<Menu> _menus = [
    Menu(
      id: '1',
      name: 'Pancakes - S',
      description: 'Oranges, Pecan, Maple syrup, Mascarpone',
      discountPercent: 0.0,
      imageUrl: '',
      price: 1200,
    ),
    Menu(
      id: '1',
      name: 'Pancakes - M',
      description: 'Oranges, Pecan, Maple syrup, Mascarpone',
      discountPercent: 0.0,
      imageUrl: '',
      price: 1200,
    ),
    Menu(
      id: '1',
      name: 'Pancakes - L',
      description: 'Oranges, Pecan, Maple syrup, Mascarpone',
      discountPercent: 0.0,
      imageUrl: '',
      price: 1200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: 'category_image${category.id}',
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 0,
                    ),
                    image: DecorationImage(
                      image: AssetImage(category.imageUrl),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 10,
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    color: Color(0xff717478),
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20,
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  Expanded(
                                    child: Text(''),
                                  ),
                                  CircleButton(
                                    margin: EdgeInsets.all(10),
                                    size: 33,
                                    child: Icon(
                                      Icons.search,
                                      color: kNormalFontColor,
                                      size: 20,
                                    ),
                                    onPress: () {},
                                  ),
                                  CircleButton(
                                    size: 33,
                                    child: Icon(
                                      Icons.list,
                                      color: kNormalFontColor,
                                      size: 20,
                                    ),
                                    onPress: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(45),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Wrap(
                    children: List.generate(
                      category.tags.length,
                      (index) => Transform.scale(
                        child: Chip(
                          padding: EdgeInsets.zero,
                          label: Text(category.tags[index]),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xffA2A3A6),
                          ),
                          backgroundColor: kTagColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        alignment: Alignment.centerLeft,
                        scale: 0.8,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 33.0,
                    right: 33.0,
                    top: 15,
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(category.availableTime),
                      Text(
                        'Min - ${category.price} kyats',
                        style: TextStyle(
                          color: kNormalFontColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 30),
                    scrollDirection: Axis.horizontal,
                    itemCount: _menuTypes.length,
                    itemBuilder: (ctx, i) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          height: 30,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _menuTypes.forEach(
                                    (element) => element.active = false);
                                _menuTypes[i].active = true;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  _menuTypes[i].name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: _menuTypes[i].active
                                        ? Colors.black
                                        : kNormalFontColor,
                                    fontWeight: _menuTypes[i].active
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: Duration(
                                    milliseconds: 300,
                                  ),
                                  width: _menuTypes[i].active ? 22 : 0,
                                  height: 3,
                                  color: kOrangeColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
