// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Cart Page".text.make()),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _cartTotal()],
      ),
    );
  }
}

// ignore: camel_case_types
class _cartTotal extends StatelessWidget {
  // ignore: duplicate_ignore
  // ignore: unused_element_parameter
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer<MyStore>(
            mutations: {RemoveMutation},
            builder: (context, store, _) {
              return "\$${_cart?.totalPrice}".text.xl5.color(Colors.red).make();
            },
          ),

          30.widthBox,
          ElevatedButton(
            onPressed: () {
              if (_cart?.items.isEmpty ?? true) {
                // Check if cart is empty
                VxToast.show(
                  context,
                  msg: "No items in cart",
                  position: VxToastPosition.center,
                );
              } else {
                VxToast.show(
                  context,
                  msg: "Not implemented yet",
                  position: VxToastPosition.center,
                );
              }
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.red),
            ),
            child: "Checkout".text.color(Colors.white).bold.xl.make(),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VxBuilder<MyStore>(
      mutations: {RemoveMutation},
      builder: (context, store, _) {
        final CartModel? _cart = (VxState.store as MyStore).cart;

        return _cart?.items.isEmpty ??
                true // Check if cart is empty
            ? "No items in cart".text.xl4.center.bold
                .make() // Display message if cart is empty
            : ListView.builder(
              itemCount: _cart?.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.done),
                  title: _cart?.items[index].name.text.make(),
                  trailing: const Icon(Icons.remove_circle_outline),
                  onTap: () {
                    RemoveMutation(_cart!.items[index]);
                    VxToast.show(
                      context,
                      msg: "Item removed from cart",
                      position: VxToastPosition.center,
                    );
                  },
                );
              },
            );
      },
    );
  }
}
