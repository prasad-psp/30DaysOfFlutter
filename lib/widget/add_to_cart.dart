import 'package:catlog_app/models/cart_model.dart';
import 'package:catlog_app/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  bool isAlreadyInCart = false;

  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final cart = (VxState.store as MyStore).cartModel;
    isAlreadyInCart = cart!.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isAlreadyInCart) {
          AddMutation(item: catalog);
          // setState(() {});
        }
      },
      child: isAlreadyInCart
          ? Icon(Icons.done)
          : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
