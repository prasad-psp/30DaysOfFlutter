import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        const Placeholder().p32().expand(),
        const Divider(),
        const _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "\$9999".text.xl4.color(context.accentColor).make(),
        30.widthBox,
        ElevatedButton(
          onPressed: () {},
          child: "Buy".text.make(),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor)),
        ).w32(context)
      ]),
    );
  }
}
