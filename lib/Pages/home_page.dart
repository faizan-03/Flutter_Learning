import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
// ignore: unused_import
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
// ignore: unused_import
import 'package:flutter_application_1/widgets/item_widget.dart';

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
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: Color.fromARGB(255, 96, 179, 212),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            // ignore: unnecessary_null_comparison
            (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
                ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final item = CatalogModels.items[index];
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GridTile(
                        footer: GridTileBar(
                          title: Text(item.name),
                          subtitle: Text('\$${item.price}'),
                          backgroundColor: Colors.black54,
                        ),
                        child: Image.network(item.imageUrl),
                      ),
                    );
                  },
                  itemCount: CatalogModels.items.length,
                )
                // ? ListView.builder(
                //   itemCount: CatalogModels.items.length,
                //   itemBuilder: (context, index) {
                //     return ItemWidget(item: CatalogModels.items[index]);
                //   },
                // )
                : Center(child: CircularProgressIndicator()),
      ),

      drawer: MyDrawer(), // Optional: Add a Drawer widget if needed
    );
  }
}
