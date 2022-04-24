import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class HeadingWidgets extends StatelessWidget {
  const HeadingWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.xl4.color(context.accentColor).make(),
        "Trending Products".text.xl.make(),
      ],
    );
  }
}