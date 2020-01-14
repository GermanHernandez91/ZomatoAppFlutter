import 'package:flutter/material.dart';
import 'package:zomato_app/screens/main_screen.dart';
import 'package:zomato_app/screens/onboarding_screen.dart';
import 'package:zomato_app/services/location_service.dart';
import 'package:zomato_app/widgets/loading_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _redirectTo() async {
    if (await LocationService.userLocationIsStored()) {
      Navigator.pushReplacementNamed(context, MainScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    _redirectTo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingWidget(),
      ),
    );
  }
}
