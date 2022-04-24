import 'package:catlog_app/pages/cart_page.dart';
import 'package:catlog_app/pages/home_page.dart';
import 'package:catlog_app/pages/login_page.dart';
import 'package:catlog_app/routes/myroutes.dart';
import 'package:catlog_app/store/store.dart';
import 'package:catlog_app/widget/mythemes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(VxState(store: MyStore(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Catlog App",
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
