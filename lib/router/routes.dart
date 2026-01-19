import 'package:credpal_ui_test/presentation/screens/home.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> get routes => {
    HomeScreen.routeName: (context) => HomeScreen(),
  };
}
