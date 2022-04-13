import 'package:catlog_app/models/catalog.dart';
import 'package:catlog_app/widget/mythemes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Vx.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.xl3.red800.bold.make(),
            ElevatedButton(
              onPressed: () => {},
              child: "Buy".text.make(),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyThemes.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ).wh(100, 40)
          ],
        ).p8(),
      ),
      backgroundColor: MyThemes.creameColor,
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
                color: Vx.white,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyThemes.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl.make(),
                    10.heightBox,
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
