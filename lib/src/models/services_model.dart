// // To parse this JSON data, do
// //
// //     final servicesModel = servicesModelFromJson(jsonString);

// import 'dart:convert';

// ServicesModel servicesModelFromJson(String str) => ServicesModel.fromJson(json.decode(str));

// String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

// class ServicesModel {
//     final String? serviceTitle;
//     final String? serviceDescription;
//     final double? servicePrice;
//     final double? serviceVatSd;
//     final String? serviceCategoryId;
//     final String? duration;
//     final List<ImageGallery>? imageGallery;
//     final String? serviceReview;
//     final bool? isFeature;
//     final bool? isFavourite;
//     final bool? isBooked;
//     final String? serviceAppointment;
//     final String? provider;

//     ServicesModel({
//         this.serviceTitle,
//         this.serviceDescription,
//         this.servicePrice,
//         this.serviceVatSd,
//         this.serviceCategoryId,
//         this.duration,
//         this.imageGallery,
//         this.serviceReview,
//         this.isFeature,
//         this.isFavourite,
//         this.isBooked,
//         this.serviceAppointment,
//         this.provider,
//     });

//     factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
//         serviceTitle: json["service_title"],
//         serviceDescription: json["service_description"],
//         servicePrice: json["service_price"],
//         serviceVatSd: json["service_vatSd"],
//         serviceCategoryId: json["service_categoryId"],
//         duration: json["duration"],
//         imageGallery: json["image_gallery"] == null ? [] : List<ImageGallery>.from(json["image_gallery"]!.map((x) => ImageGallery.fromJson(x))),
//         serviceReview: json["service_review"],
//         isFeature: json["isFeature"],
//         isFavourite: json["isFavourite"],
//         isBooked: json["isBooked"],
//         serviceAppointment: json["service_appoinment"],
//         provider: json["provider"],
//     );

//     Map<String, dynamic> toJson() => {
//         "service_title": serviceTitle,
//         "service_description": serviceDescription,
//         "service_price": servicePrice,
//         "service_vatSd": serviceVatSd,
//         "service_categoryId": serviceCategoryId,
//         "duration": duration,
//         "image_gallery": imageGallery == null ? [] : List<dynamic>.from(imageGallery!.map((x) => x.toJson())),
//         "service_review": serviceReview,
//         "isFeature": isFeature,
//         "isFavourite": isFavourite,
//         "isBooked": isBooked,
//         "service_appoinment": serviceAppointment,
//         "provider": provider,
//     };
// }

// class ImageGallery {
//     final String? title;
//     final String? imageUrl;

//     ImageGallery({
//         this.title,
//         this.imageUrl,
//     });

//     factory ImageGallery.fromJson(Map<String, dynamic> json) => ImageGallery(
//         title: json["title"],
//         imageUrl: json["imageUrl"],
//     );

//     Map<String, dynamic> toJson() => {
//         "title": title,
//         "imageUrl": imageUrl,
//     };
// }



class ServicesModel {
  final int id;
  final String serviceTitle;
  final String serviceDescription;
  final double servicePrice;
  final double serviceVatSd;
  final String serviceCategory;
  final String duration;
  final List<String> imageGallery;
  final String serviceReview;
  final bool isFeature;
  final bool isFavourite;
  final bool isBooked;
  final String serviceAppointment;
  final String provider;

  ServicesModel({
    required this.id,
    required this.serviceTitle,
    required this.serviceDescription,
    required this.servicePrice,
    required this.serviceVatSd,
    required this.serviceCategory,
    required this.duration,
    required this.imageGallery,
    required this.serviceReview,
    required this.isFeature,
    required this.isFavourite,
    required this.isBooked,
    required this.serviceAppointment,
    required this.provider,
  });

}
