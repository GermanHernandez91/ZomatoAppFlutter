import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle title = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );

  static const TextStyle headline = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static const TextStyle subtitle = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle caption = TextStyle(
    color: Colors.grey,
    fontSize: 16,
  );

  static const TextStyle button = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body = TextStyle(
    color: Colors.black87,
    fontSize: 14,
  );
}
