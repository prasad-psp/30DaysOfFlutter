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
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final item = CatalogModel.items![index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                          header: Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              item.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                            ),
                          ),
                          footer: Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "\$${item.price.toString()}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                          child: Image.network(item.imageUrl))),
                );
              },
              itemCount: CatalogModel.items!.length,
            )
          : const Center(child: CircularProgressIndicator()),
      drawer: const MyDrawer(),
    );
  }
}
