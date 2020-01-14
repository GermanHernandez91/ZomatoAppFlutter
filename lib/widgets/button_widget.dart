import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final String buttonTitle;
  final Function onPressed;

  ButtonWidget({
    @required this.width,
    @required this.buttonTitle,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width,
      height: 50,
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.deepPurpleAccent,
        textColor: Colors.white,
        child: Text(
          buttonTitle,
          style: Theme.of(context).textTheme.button,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
