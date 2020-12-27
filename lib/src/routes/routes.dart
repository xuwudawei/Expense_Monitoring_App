import 'package:expense_monitoring/src/widgets/HomePageWidgets/homePage.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login/home':
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
