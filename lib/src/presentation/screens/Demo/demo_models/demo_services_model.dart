class Category {
  String categoryTitle;
  String categoryDescription;

  Category({required this.categoryTitle, required this.categoryDescription});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryTitle: json['category_title'] ?? '',
      categoryDescription: json['category_des'] ?? '',
    );
  }
}

class Service {
  String title;
  String description;
  List<Category> categories;

  Service({required this.title, required this.description, required this.categories});

  factory Service.fromJson(Map<String, dynamic> json) {
    var categoriesJson = json['category'] as List;
    List<Category> categoriesList = categoriesJson.map((categoryJson) => Category.fromJson(categoryJson)).toList();

    return Service(
      title: json['title'] ?? '',
      description: json['des'] ?? '',
      categories: categoriesList,
    );
  }
}