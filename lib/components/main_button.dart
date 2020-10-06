import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPressed;

  const MainButton({
    this.color,
    this.title,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: RaisedButton(
        onPressed: onPressed,
        color: color,
        textColor: Colors.white,
        child: Text(title),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
