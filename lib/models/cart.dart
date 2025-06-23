// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // Internal, private state
  final List<int> _itemIds = [];

  // ignore: prefer_final_fields
  CatalogModels _catalog = CatalogModels();

  CatalogModels get catalog => _catalog;

  set catalog(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Check if item is in cart
  bool isInCart(Item item) => _itemIds.contains(item.id);

  // Get total price
  double get totalPrice => double.parse(
    (items.fold(
      0.0,
      (total, current) => total + current.price,
    )).toStringAsFixed(2),
  );

  // Remove item from cart
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart?._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart?._itemIds.remove(item.id);
  }
}
