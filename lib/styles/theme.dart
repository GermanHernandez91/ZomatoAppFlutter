import 'package:flutter/material.dart';
import 'package:zomato_app/styles/text_styles.dart';

ThemeData buildLightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    accentColor: Colors.deepPurpleAccent,
    textTheme: TextTheme(
      title: TextStyles.title,
      headline: TextStyles.headline,
      caption: TextStyles.caption,
      subtitle: TextStyles.subtitle,
      button: TextStyles.button,
      body1: TextStyles.body,
    ),
  );
}
