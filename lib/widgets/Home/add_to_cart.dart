// ignore_for_file: no_leading_underscores_for_local_identifiers, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBuilder<MyStore>(
      mutations: {AddMutation, RemoveMutation},
      builder: (context, store, _) {
        final CartModel? _cart = (VxState.store as MyStore).cart;
        final bool _isInCart = _cart?.items.contains(catalog) ?? false;

        return ElevatedButton(
          onPressed: () {
            if (!_isInCart) {
              AddMutation(catalog); // Triggers mutation
            }
          },
          child:
              _isInCart
                  ? Icon(Icons.check)
                  : Icon(CupertinoIcons.cart_badge_plus),
        );
      },
    );
  }
}
