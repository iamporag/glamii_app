import 'dart:convert';
import 'demo_product_model.dart';

// Sample data (simulating a local database or API response)
String categoriesJson = '''
[
  {
    "id": "1",
    "title": "Electronics",
    "products": [
      {
        "product_id": "101",
        "products_title": "Smartphone",
        "products_des": "A high-end smartphone with an excellent camera",
        "category": "Electronics"
      },
      {
        "product_id": "102",
        "products_title": "Laptop",
        "products_des": "A lightweight and powerful laptop",
        "category": "Electronics"
      }
    ]
  },
  {
    "id": "2",
    "title": "Fashion",
    "products": [
      {
        "product_id": "201",
        "products_title": "T-shirt",
        "products_des": "A comfortable cotton T-shirt",
        "category": "Fashion"
      },
      {
        "product_id": "202",
        "products_title": "Jeans",
        "products_des": "Stylish denim jeans",
        "category": "Fashion"
      }
    ]
  }
]
''';

// Fetch all categories
Future<List<Category>> fetchCategories() async {
  await Future.delayed(Duration(seconds: 1)); // Simulating network delay

  final List<dynamic> jsonData = json.decode(categoriesJson);
  return jsonData.map((json) => Category.fromJson(json)).toList();
}

// Fetch a specific category by ID
Future<Category?> fetchCategoryById(String categoryId) async {
  List<Category> categories = await fetchCategories();

  // Find the category by ID
  return categories.firstWhere(
    (category) => category.id == categoryId,
    orElse: () => Category(id: '', title: '', products: []), // Return empty if not found
  );
}

// Fetch a product by ID within a category
Future<Product?> fetchProductById(String categoryId, String productId) async {
  Category? category = await fetchCategoryById(categoryId);

  // Find the product by productId in the category
  return category?.products.firstWhere(
    (product) => product.productId == productId,
    orElse: () => Product(
      productId: '', 
      productTitle: 'Not Found', 
      productDescription: '', 
      category: '',
    ), // Return empty product if not found
  );
}