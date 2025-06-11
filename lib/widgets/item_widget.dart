import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('ItemWidget');

class ItemWidget extends StatelessWidget {
  final Item item;

  // ignore: use_super_parameters
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),

      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.imageUrl),
          radius: 30,
        ),
        title: Text(
          item.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          item.description,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        trailing: Text(
          '\$${item.price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 18,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          // Handle item tap if needed
          _logger.info('Item tapped: ${item.name}');
        },
      ),
    );
  }
}
