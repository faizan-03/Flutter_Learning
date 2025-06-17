// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catalog.name),
        backgroundColor: context.canvasColor,
        elevation: 0,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: const EdgeInsets.all(16.0),
        children: [
          "\$${catalog.price}".text.xl4.bold.make(),
          ElevatedButton(
            onPressed: () {
              // Add your add to cart logic here
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),

              backgroundColor: WidgetStateProperty.all(Colors.blue),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              ),
            ),
            child: "Buy".text.make(),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child:
                  Image.network(
                    catalog.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            Icon(Icons.error, size: 100),
                  ).centered(),
            ),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.top,
                arcType: VxArcType.convex,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      catalog.name.text.xl4.bold.make().centered(),
                      catalog.description.text.xl2.make().p16().centered(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
