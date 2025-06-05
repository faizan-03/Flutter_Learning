class CatalogModels {
  static final items = [
    Item(
      id: 1,
      name: "Wireless Headphones",
      description: "High-quality wireless headphones with noise cancellation.",
      price: 99.99,
      color: "#1E1E1E",
      imageUrl:
          "https://dummyjson.com/image/300x300/1E1E1E/FFFFFF?text=Headphones",
    ),
  ];
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
}
