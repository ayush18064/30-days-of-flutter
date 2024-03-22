import 'package:flutter/material.dart';
import 'package:play/pages/home_page.dart';
import 'package:play/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      // initialRoute: "/LoginPage()",
      routes: {
        "/": (context) => const LoginPage(),
        "/login": (context) => const LoginPage(),
        "/home": (context) => Homepage(),
      },
    );
  }
}
