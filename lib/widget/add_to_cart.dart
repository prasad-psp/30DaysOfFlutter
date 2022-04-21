import 'package:catlog_app/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAlreadyInCart = false;

  @override
  Widget build(BuildContext context) {
    final cart = CartModel();
    isAlreadyInCart = cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isAlreadyInCart) {
          isAlreadyInCart = true;
          final _catalog = CatalogModel();
          cart.catalog = _catalog;
          cart.add(widget.catalog);
          setState(() {});
        }
      },
      child: isAlreadyInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}