import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:zomato_app/widgets/loading_widget.dart';

class ProgressWidget extends StatelessWidget {
  final bool state;
  final Widget child;

  ProgressWidget({@required this.state, @required this.child});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: state,
      opacity: 0.8,
      progressIndicator: LoadingWidget(),
      child: child,
    );
  }
}
