import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/screens/get_started_screen.dart';
import 'package:ohmyfood_flutter/screens/landing_screen.dart';
import 'package:ohmyfood_flutter/screens/start_screen.dart';

void main() => runApp(OhMyFood());

class OhMyFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        // textTheme: TextTheme(bodyText2: TextStyle())
      ),
      initialRoute: LandingScreen.routeName,
      routes: {
        LandingScreen.routeName: (context) => LandingScreen(),
        GetStartedScreen.routeName: (context) => GetStartedScreen(),
        StartScreen.routeName: (context) => StartScreen(),
      },
    );
  }
}
