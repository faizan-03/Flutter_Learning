import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModels? catalog;
  CartModel? cart;

  MyStore() {
    catalog = CatalogModels();
    cart = CartModel();
    cart!.catalog = catalog!; // Initialize the cart with the catalog
  }
}
