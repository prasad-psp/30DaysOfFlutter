import 'package:velocity_x/velocity_x.dart';

import 'package:catlog_app/models/catalog.dart';
import 'package:catlog_app/store/store.dart';

class CartModel {
  // Catalog model field
  CatalogModel? _catalog;

  // Collection of IDs
  final List<int> itemIds = [];

  set catalog(CatalogModel catalogModel) {
    assert(catalogModel != null);
    _catalog = catalogModel;
  }

  // Get Item in cart
  CatalogModel? get getCatalog => _catalog;

  // Get items in list
  List<Item> get items => itemIds.map((id) => _catalog!.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, currentItem) => total + currentItem.price);

  // Remove Item
  void remove(Item item) {
    itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  Item item;

  AddMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cartModel?.itemIds.add(item.id);
  }
}
