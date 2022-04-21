import 'package:catlog_app/models/catalog.dart';
import 'package:catlog_app/widget/add_to_cart.dart';
import 'package:catlog_app/widget/mythemes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.xl3.red800.bold.make(),
            AddToCart(catalog: catalog).wh(120, 40)
          ],
        ).p8(),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.imageUrl))
              .h24(context)
              .py12(),
          Expanded(
            child: VxArc(
              height: 20.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalog.desc.text
                        .textStyle(context.captionStyle!)
                        .xl
                        .make(),
                    10.heightBox,
                    "Est kasd est aliquyam amet tempor accusam ipsum diam et at. Et gubergren at magna lorem gubergren. Eos sanctus diam."
                        .text
                        .textStyle(context.captionStyle!)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
