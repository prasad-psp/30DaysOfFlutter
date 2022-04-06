import 'package:catlog_app/pages/home_page.dart';
import 'package:catlog_app/pages/login_page.dart';
import 'package:catlog_app/routes/myroutes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Catlog App",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.loginRoute: (context) =>  LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage()
      },
    ));
}
