import 'package:flutter/material.dart';
import 'package:stimassign/view/screens/Question/question_page.dart';
import 'package:stimassign/view/screens/login.dart';

import '../../view/screens/home/home_screen.dart';

class Routes {
  static const String homeScreen = "/home_screen";
  static const String loginScreen = "/login_screen";

  static const String questionScreen = "/question_page";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) =>  LoginView());
      case homeScreen:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      default:
        return null; // Default route or error handling
    }
  }
}
