import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/Home/catalog_header.dart';
import 'package:flutter_application_1/widgets/Home/catalog_list.dart';
import 'package:flutter_application_1/models/catalog.dart';
// ignore: unused_import
import 'package:flutter_application_1/utils/routes.dart';
// ignore: unused_import
import 'package:flutter_application_1/widgets/drawer.dart';
// ignore: unused_import
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: unused_field, prefer_final_fields
  bool _isHovering = false; // Variable to track hover state for the close icon

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    var catalogJson = await rootBundle.loadString('assets/data/items.json');
    var decodedData = jsonDecode(catalogJson);

    final productsData = decodedData["products"] as List;

    CatalogModels.items =
        List.from(
          productsData,
        ).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: Vx.blue600,
        foregroundColor: Colors.white,
        child: const Icon(Icons.shopping_cart),
      ),
      body: SafeArea(
        child: Padding(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              19.heightBox,
              // ignore: unnecessary_null_comparison
              if (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
                Expanded(
                  child:
                      CatalogList(), // Make list scrollable within remaining space
                )
              else
                const Expanded(
                  child: Center(
                    // Show a loading indicator while data is being fetched
                    child: CircularProgressIndicator(color: Vx.blue600),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
