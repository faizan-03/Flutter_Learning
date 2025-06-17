import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home_detail_Page.dart';
import 'package:flutter_application_1/widgets/Home/catalog_item.dart';
import 'package:flutter_application_1/models/catalog.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Use shrinkWrap to avoid infinite height error
      itemCount: CatalogModels.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModels.items[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              ),
            );
          },
          child: CatalogItem(catalog: catalog),
        );

        // Update the hover state when the item is hovered
        // This can be used to change the appearance of the item
        // if needed in the future.
      },
    );
  }
}
