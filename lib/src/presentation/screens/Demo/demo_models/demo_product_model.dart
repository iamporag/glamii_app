class Product {
  String productId;
  String productTitle;
  String productDescription;
  String category;

  // Constructor for Product
  Product({
    required this.productId,
    required this.productTitle,
    required this.productDescription,
    required this.category,
  });

  // Factory method to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'] ?? '',
      productTitle: json['products_title'] ?? '',
      productDescription: json['products_des'] ?? '',
      category: json['category'] ?? '',
    );
  }

  // Method to convert Product object to JSON
  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'products_title': productTitle,
      'products_des': productDescription,
      'category': category,
    };
  }
}

class Category {
  String id;  // Added ID for unique identification of the category
  String title;
  List<Product> products;

  // Constructor for Category
  Category({
    required this.id,
    required this.title,
    required this.products,
  });

  // Factory method to create a Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Product> productsList = productList.map((productJson) => Product.fromJson(productJson)).toList();

    return Category(
      id: json['id'] ?? '',  // Parsing the unique category ID
      title: json['title'] ?? '',
      products: productsList,
    );
  }

  // Method to convert Category object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}