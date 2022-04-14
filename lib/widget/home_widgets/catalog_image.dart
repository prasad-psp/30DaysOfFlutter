import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widget/mythemes.dart';

class CatalogImage extends StatelessWidget {
  final image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .rounded
        .color(context.canvasColor)
        .make()
        .p16()
        .w32(context);
  }
}