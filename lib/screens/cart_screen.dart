import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';

class CartScreen extends StatefulWidget {
  static const routeName = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          children: [
            Row(
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
          ],
        ),
      ),
    );
  }
}
