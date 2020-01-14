import 'package:flutter/material.dart';
import 'package:zomato_app/screens/main_screen.dart';
import 'package:zomato_app/screens/onboarding_screen.dart';
import 'package:zomato_app/screens/splash_screen.dart';
import 'package:zomato_app/styles/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'ZomatoApp',
        theme: buildLightThemeData(),
        home: SplashScreen(),
        routes: {
          OnboardingScreen.routeName: (_) => OnboardingScreen(),
          MainScreen.routeName: (_) => MainScreen(),
        },
      ),
    );
  }
}
