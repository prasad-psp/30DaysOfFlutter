import 'package:catlog_app/models/catalog.dart';
import 'dart:convert';
import 'package:catlog_app/widget/item_widget.dart';
import 'package:catlog_app/widget/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productList = decodedData["products"];
    CatalogModel.items =
        List.from(productList).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
          ? ListView.builder(
              itemCount: CatalogModel.items!.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: CatalogModel.items![index]);
              },
            )
          : const Center(child: CircularProgressIndicator()),
      drawer: const MyDrawer(),
    );
  }
}
