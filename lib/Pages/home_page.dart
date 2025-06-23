import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/Home/catalog_header.dart';
import 'package:flutter_application_1/widgets/Home/catalog_list.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:http/http.dart' as http;
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

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  loadData() async {
    await Future.delayed(Duration(seconds: 1));

    var catalogJson = await rootBundle.loadString('assets/data/items.json');
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

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
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      floatingActionButton: VxBuilder<MyStore>(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, _) {
          final _cart = (VxState.store as MyStore).cart;
          return FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: Vx.blue600,
            foregroundColor: Colors.white,
            child: const Icon(Icons.shopping_cart),
          ).badge(
            color: Vx.red600,
            count: _cart?.items.length,
            size: 22,
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        },
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
