import 'package:flutter/material.dart';
import 'package:provider_counter/utils/routes/routes_name.dart';
import 'package:provider_counter/views/login_screen.dart';
import 'package:provider_counter/views/home_screen.dart';
import 'package:provider_counter/utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesNames.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
