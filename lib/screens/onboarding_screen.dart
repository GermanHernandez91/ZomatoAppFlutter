import 'package:flutter/material.dart';
import 'package:zomato_app/screens/main_screen.dart';
import 'package:zomato_app/services/location_service.dart';
import 'package:zomato_app/widgets/alert_widget.dart';
import 'package:zomato_app/widgets/button_widget.dart';
import 'package:zomato_app/widgets/progress_widget.dart';
import 'package:zomato_app/widgets/text_field_widget.dart';

class OnboardingScreen extends StatefulWidget {
  static final String routeName = "onboarding_screen";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final TextEditingController _inputController = TextEditingController();
  bool _isLoading = false;

  _requestPermissions() async {
    await LocationService.requestPermissions();
  }

  _actionButtonPressed() async {
    setState(() {
      _isLoading = true;
    });

    if (_inputController.text.isEmpty) {
      _displayAlert("Oops !", "We need your post code in order to locate you");
    } else {
      await LocationService.storeUserCurrentLocation(_inputController.text);

      if (await LocationService.userLocationIsStored()) {
        Navigator.pushReplacementNamed(context, MainScreen.routeName);
      } else {
        _displayAlert("Something went wrong", "We couldn't get your location");
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  _displayAlert(String title, String message) {
    showDialog(
      context: context,
      child: AlertWidget(
        title: title,
        message: message,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();

    // TODO: Testing purposes
    _inputController.text = "EH112AU";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressWidget(
        state: _isLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/intro.png',
                    width: 320,
                    height: 320,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TextFieldWidget(
                      controller: _inputController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      placeholder: "Enter your post code",
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonWidget(
                    width: 300,
                    buttonTitle: "Locate me",
                    onPressed: () => _actionButtonPressed(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
