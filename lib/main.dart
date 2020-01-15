import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/providers/category_provider.dart';
import 'package:zomato_app/providers/cuisine_provider.dart';
import 'package:zomato_app/providers/restaurant_provider.dart';
import 'package:zomato_app/screens/categories_screen.dart';
import 'package:zomato_app/screens/cuisines_screen.dart';
import 'package:zomato_app/screens/main_screen.dart';
import 'package:zomato_app/screens/onboarding_screen.dart';
import 'package:zomato_app/screens/restaurants_screen.dart';
import 'package:zomato_app/screens/splash_screen.dart';
import 'package:zomato_app/styles/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  _dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _dismissKeyboard(context),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RestaurantProvider()),
          ChangeNotifierProvider(create: (_) => CuisineProvider()),
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ],
        child: MaterialApp(
          title: 'ZomatoApp',
          theme: buildLightThemeData(),
          home: SplashScreen(),
          routes: {
            OnboardingScreen.routeName: (_) => OnboardingScreen(),
            MainScreen.routeName: (_) => MainScreen(),
            CuisinesScreen.routeName: (_) => CuisinesScreen(),
            CategoriesScreen.routeName: (_) => CategoriesScreen(),
            RestaurantsScreen.routeName: (_) => RestaurantsScreen(),
          },
        ),
      ),
    );
  }
}
