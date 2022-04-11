import 'package:catlog_app/models/catalog.dart';
import 'package:catlog_app/widget/item_widget.dart';
import 'package:catlog_app/widget/mydrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int days = 30;

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(4, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: dummyList[index]);
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
