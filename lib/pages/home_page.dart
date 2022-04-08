import 'package:catlog_app/widget/mydrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int days = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Text("Welcome to $days Challenge"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
