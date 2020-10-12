import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';

class CircleButton extends StatelessWidget {
  final Widget child;
  final double size;
  final EdgeInsetsGeometry margin;
  final Function onPress;
  final Color fillColor;

  const CircleButton({
    this.child,
    this.size = 40,
    this.margin,
    @required this.onPress,
    this.fillColor = kTagColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: size,
      width: size,
      child: RawMaterialButton(
        onPressed: onPress,
        child: child,
        elevation: 0,
        fillColor: fillColor,
        shape: CircleBorder(),
      ),
    );
  }
}
