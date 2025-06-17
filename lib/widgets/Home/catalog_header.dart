import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Catalog App".text.xl4.bold.color(Vx.blue600).make(),
        "Trending Products".text.xl2.bold.color(Vx.blue600).make(),
      ],
    );
  }
}
