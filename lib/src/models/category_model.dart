// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

// import 'dart:convert';

// CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

// String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

// class CategoryModel {
//     final String? title;
//     final List<dynamic>? services;

//     CategoryModel({
//         this.title,
//         this.services,
//     });

//     factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//         title: json["title"],
//         services: json["services"] == null ? [] : List<dynamic>.from(json["services"]!.map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "title": title,
//         "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x)),
//     };
// }



import 'package:glamii_app/src/models/services_model.dart';

class Category {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<ServicesModel> services;

  Category({
    required this.services,
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl, 
  });
}
