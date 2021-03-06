import 'package:catlog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: ListTile(
          onTap: () {
            print("\$${item.name} pressed");
          },
          leading: SizedBox(
              width: 50, height: 50, child: Image.network(item.imageUrl)),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price.toString()}",
            textScaleFactor: 1.5,
            style: const TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
