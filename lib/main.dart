import 'package:flutter/material.dart';
import 'package:play/pages/home_page.dart';
import 'package:play/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/login": (context) => const LoginPage(),
        "/home": (context) => Homepage(),
      },
    );
  }
}
