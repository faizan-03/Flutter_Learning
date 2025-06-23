class CatalogModels {
  static List<Item> items = [];

  Item getById(int id) => items.firstWhere(
    (element) => element.id == id,
    orElse:
        () => Item(
          id: 0,
          name: 'Not Found',
          description: 'Item not found',
          price: 0.0,
          color: 'N/A',
          imageUrl: '',
        ),
  );

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String description;
  final double price;
  final String color;
  final String imageUrl;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.imageUrl,
  });

  factory Item.fromMap(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      color: json['color'],
      imageUrl: json['imageUrl'],
    );
  }

  toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'color': color,
    'imageUrl': imageUrl,
  };
}
