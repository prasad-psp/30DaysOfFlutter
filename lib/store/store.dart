import 'package:catlog_app/models/cart_model.dart';
import 'package:catlog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel? catalogModel;
  CartModel? cartModel;

  MyStore() {
    catalogModel = CatalogModel();
    cartModel = CartModel();
    cartModel?.catalog = catalogModel!;
  }
}
