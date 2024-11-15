// // To parse this JSON data, do
// //
// //     final providerModel = providerModelFromJson(jsonString);

// // import 'dart:convert';

// // import 'services_model.dart';

// // ProviderModel providerModelFromJson(String str) =>
// //     ProviderModel.fromJson(json.decode(str));

// // String providerModelToJson(ProviderModel data) => json.encode(data.toJson());

// // class ProviderModel {
// //   final String? providerTitle;
// //   final String? providerDescription;
// //   final String? bannerImageUrl;
// //   final String? contactNumber;
// //   final String? address;
// //   final List<ServicesModel> availableServices;
// //   final String? review;

// //   ProviderModel({
// //     this.providerTitle,
// //     this.providerDescription,
// //     this.bannerImageUrl,
// //     this.contactNumber,
// //     this.address,
// //     required this.availableServices,
// //     this.review,
// //   });

// //   factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
// //         providerTitle: json["provider_title"],
// //         providerDescription: json["provider_description"],
// //         bannerImageUrl: json["bannerImageURL"],
// //         contactNumber: json["contactNumber"],
// //         address: json["address"],
// //         availableServices: json["availableServices"] != null &&
// //                 json["availableServices"] is List
// //             ? List<ServicesModel>.from(
// //                 json["availableServices"]
// //                     .map((service) => ServicesModel.fromJson(service)),
// //               )
// //             : [], // Empty list if it's null or not a list

// //         review: json["review"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "provider_title": providerTitle,
// //         "provider_description": providerDescription,
// //         "bannerImageURL": bannerImageUrl,
// //         "contactNumber": contactNumber,
// //         "address": address,
// //         "availableServices": List<dynamic>.from(
// //             availableServices!.map((service) => service.toJson())),
// //         "review": review,
// //       };
// // }

// //   final String? providerTitle;
// //   final String? providerDescription;
// //   final String? bannerImageUrl;
// //   final String? contactNumber;
// //   final String? address;
// //   final List<ServicesModel> availableServices;
// //   final String? review;

// import 'package:glamii_app/src/models/services_model.dart';

// class ProviderModel {
//   final String providerTitle;
//   final String providerDescription;
//   final String bannerImageUrl;
//   final String contactNumber;
//   final String address;
//   final List<ServicesModel> availableServices;
//   final String categoryId; // Reference to Category by ID
//   final double price;
//   final String review;

//   ProviderModel(this.providerTitle, this.providerDescription, this.bannerImageUrl, this.contactNumber, this.address, this.availableServices, this.review, {
//     required this.title,
//     required this.description,
//     required this.categoryId,
//     required this.price, required String contactNumber, required String bannerImageUrl, required String providerDescription, required String providerTitle, required String address, required List<ServicesModel> availableServices, required String review,
//   });

//   static fromJson(decode) {}

//   Object? toJson() {}
// }

// //   final String? providerTitle;
// //   final String? providerDescription;
// //   final String? bannerImageUrl;
// //   final String? contactNumber;
// //   final String? address;
// //   final List<ServicesModel> availableServices;
// //   final String? review;

import 'package:glamii_app/src/models/services_model.dart';

class ProviderModel {
  final String id;
  final String providerTitle;
  final String providerDescription;
  final String bannerImageUrl;
  final String contactNumber;
  final String address;
  final List<ServicesModel> availableServices;
  final String review;

  ProviderModel({
    required this.id,
    required this.providerTitle,
    required this.providerDescription,
    required this.bannerImageUrl,
    required this.contactNumber,
    required this.address,
    required this.availableServices,
    required this.review,
  });
}
