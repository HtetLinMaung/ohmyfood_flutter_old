import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/screens/cart_screen.dart';

class AppLayout extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget appBar;

  AppLayout({
    this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: body,
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
        backgroundColor: kOrangeColor,
        child: Icon(
          Icons.add_shopping_cart_rounded,
        ),
      ),
    );
  }
}
