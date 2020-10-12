import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/providers/CategoryProvider.dart';
import 'package:ohmyfood_flutter/screens/get_started_screen.dart';
import 'package:ohmyfood_flutter/screens/home_screen.dart';
import 'package:ohmyfood_flutter/screens/landing_screen.dart';
import 'package:ohmyfood_flutter/screens/login_screen.dart';
import 'package:ohmyfood_flutter/screens/menu_screen.dart';
import 'package:ohmyfood_flutter/screens/otp_screen.dart';
import 'package:ohmyfood_flutter/screens/otp_verify_screen.dart';
import 'package:ohmyfood_flutter/screens/signup_screen.dart';
import 'package:ohmyfood_flutter/screens/start_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
      ],
      child: OhMyFood(),
    ));

class OhMyFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: LandingScreen.routeName,
      routes: {
        LandingScreen.routeName: (context) => LandingScreen(),
        GetStartedScreen.routeName: (context) => GetStartedScreen(),
        StartScreen.routeName: (context) => StartScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        OtpScreen.routeName: (context) => OtpScreen(),
        OtpVerifyScreen.routeName: (context) => OtpVerifyScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
      },
    );
  }
}
