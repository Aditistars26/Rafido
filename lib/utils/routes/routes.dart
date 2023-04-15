import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_counter/utils/routes/routes_name.dart';
import 'package:provider_counter/views/home_screen.dart';
import 'package:provider_counter/views/login_screen.dart';
import 'package:provider_counter/views/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
