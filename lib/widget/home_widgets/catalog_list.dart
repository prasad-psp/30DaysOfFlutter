import 'package:catlog_app/pages/home_details_page.dart';
import 'package:catlog_app/widget/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalogModel = CatalogModel.items![index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailsPage(catalog: catalogModel),
                      )),
                  child: CatalogItem(item: catalogModel));
            },
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
            ),
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalogModel = CatalogModel.items![index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailsPage(catalog: catalogModel),
                      )),
                  child: CatalogItem(item: catalogModel));
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;

  const CatalogItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(item.id.toString()),
          child: CatalogImage(image: item.imageUrl)),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item.name.text.xl.color(context.accentColor).bold.make(),
            item.desc.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${item.price}".text.bold.make(),
                AddToCart(catalog: item),
              ],
            ).pOnly(right: 4.0)
          ],
        ).p(context.isMobile?0:16),
      )
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .rounded
        .square(180)
        .make()
        .py16();
  }
}
