class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});
}

class Item {
  final String title;
  final String description;
  final String categoryId;  // Reference to Category by ID
  final double price;

  Item({required this.title, required this.description, required this.categoryId, required this.price});
}






// Sample Category Data
List<Category> categories = [
  Category(id: '1', name: 'Electronics'),
  Category(id: '2', name: 'Clothing'),
  Category(id: '3', name: 'Furniture'),
];

// Sample Item Data
List<Item> items = [
  Item(title: 'Laptop', description: 'A powerful gaming laptop', categoryId: '1', price: 1200.0),
  Item(title: 'T-Shirt', description: 'Comfortable cotton t-shirt', categoryId: '2', price: 20.0),
  Item(title: 'Sofa', description: 'A cozy 3-seater sofa', categoryId: '3', price: 500.0),
  Item(title: 'Smartphone', description: 'Latest model with great features', categoryId: '1', price: 800.0),
];
