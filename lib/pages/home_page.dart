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
      body: Container(
        color: Colors.red,
        constraints : BoxConstraints(
          minHeight: 70,
          maxHeight: 200,
          maxWidth: 200,
          minWidth: 70
        ),
        child: Container(
          color: Colors.green,
          width: 250,
          height: 250,
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
