import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  final Widget child;

  ImageBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ma-la-xiang-guo-10.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}