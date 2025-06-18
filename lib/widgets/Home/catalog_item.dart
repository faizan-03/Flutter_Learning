import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  // ignore: use_super_parameters
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(
              catalog.imageUrl,
            ).box.p8.rounded.color(Vx.gray200).make().p16().w40(context),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog.name.text.xl2.bold.make(),
                catalog.description.text.make(),
                10.heightBox,
                OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),

                    ElevatedButton(onPressed: () {}, child: "Cart".text.make()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).white.roundedLg.p12.make().py4();
  }
}
