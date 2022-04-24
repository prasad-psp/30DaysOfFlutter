import 'package:catlog_app/models/cart_model.dart';
import 'package:catlog_app/models/catalog.dart';
import 'package:catlog_app/routes/myroutes.dart';
import 'package:catlog_app/store/store.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/home_widgets/catalog_header.dart';
import '../widget/home_widgets/catalog_list.dart';

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
    final cart = (VxState.store as MyStore).cartModel;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          builder: ((context, store, status) {
            return FloatingActionButton(
              backgroundColor: context.theme.buttonColor,
              child: const Icon(CupertinoIcons.cart, color: Colors.white),
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            ).badge(
                color: Vx.red500,
                size: 20,
                count: cart?.items.length,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ));
          }),
          mutations: {AddMutation, RemoveMutation},
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingWidgets(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}
