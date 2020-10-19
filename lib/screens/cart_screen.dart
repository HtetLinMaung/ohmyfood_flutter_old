import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/providers/app_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const routeName = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleButton(
                    size: 30,
                    onPress: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  CircleButton(
                    size: 30,
                    fillColor: Colors.transparent,
                    onPress: null,
                    child: null,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                itemCount: appProvider.carts.length,
                itemBuilder: (ctx, i) {
                  return Card();
                },
              ),
            ),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                margin: EdgeInsets.all(0),
                elevation: 40,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SubTotal',
                          ),
                          Text('${appProvider.subTotal} kyats'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount Price',
                          ),
                          Text('${appProvider.discountPrice} kyats'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${appProvider.subTotal - appProvider.discountPrice} kyats',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(''),
                          ),
                          Expanded(
                            flex: 8,
                            child: MainButton(
                              elevation: 1,
                              onPressed: () {},
                              color: kDarkYellowColor,
                              title: 'Place Order',
                            ),
                          ),
                          Expanded(
                            child: Text(''),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
