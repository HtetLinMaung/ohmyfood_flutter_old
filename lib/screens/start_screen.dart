import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/image_background.dart';
import 'package:ohmyfood_flutter/components/main_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';

class StartScreen extends StatelessWidget {
  static const routeName = 'StartScreen';

  @override
  Widget build(BuildContext context) {
    return ImageBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Row(
              children: [
                Expanded(
                  child: Text(''),
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: MainButton(
                    color: kBlueColor,
                    title: "I'm new",
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: Text(''),
                  flex: 1,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Row(
              children: [
                Expanded(
                  child: Text(''),
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: MainButton(
                    color: kOrangeColor,
                    title: "I've been here",
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: Text(''),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
