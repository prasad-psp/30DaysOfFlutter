import 'package:catlog_app/login_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Catlog App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/login": (context) =>  LoginPage(),
        "/home": (context) => HomePage()
      },
    ));
}
