// // Dummy Data for Glamii Providers
// import '../models/provider_model.dart';
// import '../models/services_model.dart';

// List<String> glamiiDummyJsonData = [
//   '''{
//     "provider_title": "Glow Beauty Salon",
//     "provider_description": "A full-service beauty salon offering haircuts, styling, and skincare treatments.",
//     "bannerImageURL": "https://images.pexels.com/photos/19834349/pexels-photo-19834349/free-photo-of-beauticians-hands-around-smiling-model.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-890",
//     "address": "101 Glam St, BeautyCity, BC",
//     "availableServices": "Haircuts, Styling, Facials, Manicure & Pedicure",
//     "review": "4.7"
//   }''',
//   '''{
//     "provider_title": "Serenity Spa",
//     "provider_description": "Relax and rejuvenate at Serenity Spa with a wide range of massage and wellness services.",
//     "bannerImageURL": "https://images.pexels.com/photos/20758188/pexels-photo-20758188/free-photo-of-woman-with-foil-with-skin-care-cosmetic-on-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-891",
//     "address": "202 Peace Rd, TranquilTown, TT",
//     "availableServices": "Massage, Facials, Aromatherapy, Body Scrubs",
//     "review": "4.9"
//   }''',
//   '''{
//     "provider_title": "Fitness & Wellness Gym",
//     "provider_description": "Achieve your fitness goals with our state-of-the-art gym equipment and expert trainers.",
//     "bannerImageURL": "https://images.pexels.com/photos/20758188/pexels-photo-20758188/free-photo-of-woman-with-foil-with-skin-care-cosmetic-on-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-892",
//     "address": "303 Fitness Blvd, HealthyCity, HC",
//     "availableServices": "Gym Membership, Personal Training, Yoga, Pilates",
//     "review": "4.6"
//   }''',
//   '''{
//     "provider_title": "Polished Nails Lounge",
//     "provider_description": "Get the best manicures, pedicures, and nail art at Polished Nails Lounge.",
//     "bannerImageURL": "https://images.pexels.com/photos/20758188/pexels-photo-20758188/free-photo-of-woman-with-foil-with-skin-care-cosmetic-on-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-893",
//     "address": "404 Nail Ave, GlitzTown, GT",
//     "availableServices": "Manicures, Pedicures, Nail Art, Gel Nails",
//     "review": "4.8"
//   }''',
//   '''{
//     "provider_title": "Luxe Hair Studio",
//     "provider_description": "Transform your hair with the latest trends and luxury hair care treatments.",
//     "bannerImageURL": "https://images.pexels.com/photos/20758188/pexels-photo-20758188/free-photo-of-woman-with-foil-with-skin-care-cosmetic-on-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-894",
//     "address": "505 Style Rd, ChicCity, CC",
//     "availableServices": "Haircuts, Coloring, Blowouts, Hair Extensions",
//     "review": "4.5"
//   }''',
//   '''{
//     "provider_title": "Rejuvenate Wellness Clinic",
//     "provider_description": "Wellness services designed to revitalize your body and mind.",
//     "bannerImageURL": "https://images.pexels.com/photos/20758188/pexels-photo-20758188/free-photo-of-woman-with-foil-with-skin-care-cosmetic-on-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-895",
//     "address": "606 Wellness St, HolisticTown, HT",
//     "availableServices": "Acupuncture, Detox Programs, Wellness Consultations",
//     "review": "4.7"
//   }''',
//   '''{
//     "provider_title": "Diamond Shine Spa",
//     "provider_description": "Indulge in luxurious spa treatments with Diamond Shine Spa.",
//     "bannerImageURL": "https://images.pexels.com/photos/20758188/pexels-photo-20758188/free-photo-of-woman-with-foil-with-skin-care-cosmetic-on-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-896",
//     "address": "707 Diamond Rd, OpulentCity, OC",
//     "availableServices": "Facials, Body Wraps, Massage, Steam Room",
//     "review": "4.6"
//   }''',
//   '''{
//     "provider_title": "Radiance Cosmetic Clinic",
//     "provider_description": "Expert cosmetic treatments to enhance your beauty and confidence.",
//     "bannerImageURL": "https://images.pexels.com/photos/20758188/pexels-photo-20758188/free-photo-of-woman-with-foil-with-skin-care-cosmetic-on-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-897",
//     "address": "808 Beauty Blvd, GlamCity, GC",
//     "availableServices": "Botox, Lip Fillers, Skin Treatments, Laser Hair Removal",
//     "review": "4.8"
//   }''',
//   '''{
//     "provider_title": "Urban Glow Tanning Studio",
//     "provider_description": "Get a perfect tan year-round at Urban Glow Tanning Studio.",
//     "bannerImageURL": "https://images.pexels.com/photos/20758188/pexels-photo-20758188/free-photo-of-woman-with-foil-with-skin-care-cosmetic-on-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-898",
//     "address": "909 Glow Rd, TanTown, TT",
//     "availableServices": "Tanning, Spray Tan, Skin Care Treatments",
//     "review": "4.5"
//   }''',
//   '''{
//     "provider_title": "Pure Bliss Facial Studio",
//     "provider_description": "Enjoy rejuvenating facials and skincare services at Pure Bliss Facial Studio.",
//     "bannerImageURL": "https://images.pexels.com/photos/20758188/pexels-photo-20758188/free-photo-of-woman-with-foil-with-skin-care-cosmetic-on-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "contactNumber": "+1-234-567-899",
//     "address": "1010 Glow Ave, FacialTown, FT",
//     "availableServices": "Facials, Skin Care Treatments, Acne Solutions",
//     "review": "4.9"
//   }'''
// ];

// // dummy_data.dart for ProviderModel

// List<ProviderModel> generateProviderData() {
//   // Get the list of services (you could filter or map them to the provider)
//   List<ServicesModel> services = generateServiceData(); // Get all services

//   return [
//     ProviderModel(
//       providerTitle: "Luxury Salon & Spa",
//       providerDescription:
//           "A luxurious salon offering the best spa and beauty treatments.",
//       bannerImageUrl: "https://example.com/luxury-salon-banner.jpg",
//       contactNumber: "+1-555-1234",
//       address: "123 Luxury St, Fancy City, FC",
//       availableServices: services
//           .where((service) => service.provider == "Luxury Salon & Spa")
//           .toList(), // Filter services by provider, // You can add services here later
//       review: "4.8",
//     ),
//     ProviderModel(
//       providerTitle: "Glow Beauty Studio",
//       providerDescription:
//           "Your go-to place for top-notch beauty services, from haircuts to facials.",
//       bannerImageUrl: "https://example.com/glow-beauty-banner.jpg",
//       contactNumber: "+1-555-9876",
//       address: "789 Glow St, Beauty Town, BT",
//       availableServices: services
//           .where((service) => service.provider == "Luxury Salon & Spa")
//           .toList(), // Filter services by provider, // You can add services here later
//       review: "4.7",
//     ),
//     ProviderModel(
//       providerTitle: "Blissful Retreat",
//       providerDescription:
//           "A retreat offering wellness, massages, and rejuvenating beauty treatments.",
//       bannerImageUrl: "https://example.com/blissful-retreat-banner.jpg",
//       contactNumber: "+1-555-5678",
//       address: "456 Bliss Rd, Calm City, CC",
//       availableServices: services
//           .where((service) => service.provider == "Luxury Salon & Spa")
//           .toList(), // Filter services by provider, // You can add services here later
//       review: "4.9", title: null,
//     ),
//   ];
// }

// // dummy_data.dart for ServiceModel

// List<ServicesModel> generateServiceData() {
//   return [
//     ServicesModel(
//       serviceTitle: "Haircut",
//       serviceDescription: "A stylish haircut with the latest trends.",
//       servicePrice: 30.00,
//       serviceVatSd: 10.00,
//       serviceCategoryId: "1",
//       duration: "30 mins",
//       imageGallery: [
//         ImageGallery(
//             title: "Short Hair", imageUrl: "https://example.com/haircut1.jpg")
//       ],
//       serviceReview: "4.5",
//       isFeature: true,
//       isFavourite: true,
//       isBooked: false,
//       serviceAppointment: "Available",
//       provider: "Luxury Salon & Spa",
//     ),
//     ServicesModel(
//       serviceTitle: "Facial",
//       serviceDescription: "A rejuvenating facial for healthy skin.",
//       servicePrice: 60.00,
//       serviceVatSd: 12.00,
//       serviceCategoryId: "2",
//       duration: "45 mins",
//       imageGallery: [
//         ImageGallery(
//             title: "Facial Treatment",
//             imageUrl: "https://example.com/facial1.jpg")
//       ],
//       serviceReview: "4.8",
//       isFeature: true,
//       isFavourite: false,
//       isBooked: false,
//       serviceAppointment: "Available",
//       provider: "Glow Beauty Studio",
//     ),
//     ServicesModel(
//       serviceTitle: "Massage",
//       serviceDescription: "A soothing full-body massage to relax your muscles.",
//       servicePrice: 70.00,
//       serviceVatSd: 15.00,
//       serviceCategoryId: "3",
//       duration: "60 mins",
//       imageGallery: [
//         ImageGallery(
//             title: "Deep Tissue Massage",
//             imageUrl: "https://example.com/massage1.jpg")
//       ],
//       serviceReview: "4.7",
//       isFeature: true,
//       isFavourite: true,
//       isBooked: false,
//       serviceAppointment: "Available",
//       provider: "Blissful Retreat",
//     ),
//   ];
// }

import 'package:glamii_app/src/models/provider_model.dart';
import 'package:glamii_app/src/models/services_model.dart';

import '../models/category_model.dart';

//Data For Category

List<Category> categories = [
  Category(
    id: '1',
    name: 'Hair Care & Styling',
    description:
        "Unlock expert tips on maintaining healthy hair and achieving your desired looks. From hair care routines and styling tutorials to the latest hair trends, discover the best products and techniques for every hair type. Includes virtual hair try-ons and personalized recommendations.",
    imageUrl:
        'https://images.pexels.com/photos/3356170/pexels-photo-3356170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  services: providerData
        .expand((c) => c.availableServices)
        .where((servicess) => servicess.serviceCategory == '1')
        .toList(),
  ),
  Category(
    id: '2',
    name: 'Spa & Relaxation',
    description:
        ' Indulge in the ultimate self-care with at-home spa treatments, relaxation techniques, and wellness advice. Explore guided spa routines, aromatherapy tips, and DIY facial masks, or book appointments at top-rated spas nearby for a luxurious experience.',
    imageUrl:
        'https://images.pexels.com/photos/6629538/pexels-photo-6629538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  services: providerData
        .expand((c) => c.availableServices)
        .where((servicess) => servicess.serviceCategory == '2')
        .toList(),
  ),
  Category(
    id: '3',
    name: "Makeup Artistry",
    description:
        "Enhance your beauty skills with expert makeup tutorials, tips for different occasions, and product recommendations. From everyday looks to bold glam styles, discover step-by-step guides, virtual try-ons, and personalized makeup suggestions based on your preferences.",
    imageUrl:
        "https://images.pexels.com/photos/7312413/pexels-photo-7312413.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  services: providerData
        .expand((c) => c.availableServices)
        .where((servicess) => servicess.serviceCategory == '3')
        .toList(),
  ),
  Category(
    id: '4',
    name: "Nail Art & Design",
    description:
        "Express yourself with creative nail designs, trends, and tutorials. Learn how to master the art of manicure and pedicure, explore seasonal nail trends, and get inspiration for unique nail art ideas. Book professional nail services or shop nail products directly through the app.",
    imageUrl:
        "https://images.pexels.com/photos/887352/pexels-photo-887352.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  services: providerData
        .expand((c) => c.availableServices)
        .where((servicess) => servicess.serviceCategory == '4')
        .toList(),),
  Category(
    id: '5',
    name: "Skincare & Treatments",
    description:
        "Unlock the secrets to glowing, healthy skin with personalized skincare routines, product reviews, and expert dermatological advice. Discover skincare solutions for different skin types and concerns, such as acne, dryness, and aging, and track your progress with a skincare journal.",
    imageUrl:
        "https://images.pexels.com/photos/3762871/pexels-photo-3762871.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  services: providerData
        .expand((c) => c.availableServices)
        .where((servicess) => servicess.serviceCategory == '5')
        .toList(),),
  Category(
    id: '6',
    name: "Massage & Body Care",
    description:
        "Relieve tension and enhance your well-being with expert massage techniques and body care routines. Whether you're interested in at-home self-massage tips, therapeutic body treatments, or booking an in-person massage appointment, this category provides all the tools for relaxation and rejuvenation.",
    imageUrl:
        "https://images.pexels.com/photos/3764568/pexels-photo-3764568.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  services: providerData
        .expand((c) => c.availableServices)
        .where((servicess) => servicess.serviceCategory == '6')
        .toList(),),
];


// Helper method to get the company by ID
ProviderModel? getProviderById(String providerId) {
  return providerData.firstWhere(
    (provider) => provider.id == providerId,
    orElse: () => ProviderModel(
        id: "",
        providerTitle: "",
        providerDescription: "",
        bannerImageUrl: "",
        contactNumber: "",
        address: "",
        availableServices: [],
        review: ""),
  );
}



// Sample Provider Data
List<ProviderModel> providerData = [
  ProviderModel(
    id: "1",
    providerTitle: "Luxury Salon & Spa",
    providerDescription:
        "An award-winning salon offering a range of beauty treatments designed for ultimate relaxation and rejuvenation.",
    bannerImageUrl:
        "https://images.pexels.com/photos/7195802/pexels-photo-7195802.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    contactNumber: "+1 234 567 890",
    address: "123 Beauty Ave, Glamour City",
    availableServices: [
      ServicesModel(
        id: 1,
        serviceTitle: "Facial Treatment",
        serviceDescription: "Facial Treatment",
        servicePrice: 50.00,
        serviceVatSd: 2.00,
        serviceCategory: '1',
        duration: "60 mins",
        imageGallery: [
          "https://images.pexels.com/photos/7195802/pexels-photo-7195802.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          "https://images.pexels.com/photos/7195802/pexels-photo-7195802.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
         
        ],
        serviceReview: "4.5",
        isFeature: true,
        isFavourite: true,
        isBooked: true,
        serviceAppointment: "10-11-2024",
        provider: '1',
      ),
    ],
    review: "4.7",
  ),
  ProviderModel(
    id: "2",
    providerTitle: "providerTitle",
    providerDescription: "providerDescription",
    bannerImageUrl:
        "https://images.pexels.com/photos/19641830/pexels-photo-19641830/free-photo-of-woman-lying-on-a-massage-table-and-getting-a-massage.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    contactNumber: "contactNumber",
    address: "address",
    availableServices: [
      ServicesModel(
        id: 1,
        serviceTitle: 'Professional Hair Styling',
        serviceDescription: "Get a stunning new look with our top stylists.",
        servicePrice: 50.00,
        serviceVatSd: 2.00,
        serviceCategory: "1",
        duration: "duration",
        imageGallery: [
          "https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          "https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          "https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        ],
        serviceReview: "4.7",
        isFeature: true,
        isFavourite: true,
        isBooked: true,
        serviceAppointment: "11-11-2024",
        provider: '2',
      ),
      ServicesModel(
        id: 2,
        serviceTitle: 'Professional Hair Styling',
        serviceDescription: "Get a stunning new look with our top stylists.",
        servicePrice: 50.00,
        serviceVatSd: 2.00,
        serviceCategory: "2",
        duration: "duration",
        imageGallery: [
          "https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          "https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          "https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        ],
        serviceReview: "4.7",
        isFeature: true,
        isFavourite: true,
        isBooked: true,
        serviceAppointment: "11-11-2024",
        provider: '2',
      ),
      ServicesModel(
        id: 3,
        serviceTitle: 'Professional Hair Styling',
        serviceDescription: "Get a stunning new look with our top stylists.",
        servicePrice: 50.00,
        serviceVatSd: 2.00,
        serviceCategory: "3",
        duration: "duration",
        imageGallery: [
          "https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          "https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          "https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        ],
        serviceReview: "4.7",
        isFeature: true,
        isFavourite: true,
        isBooked: true,
        serviceAppointment: "11-11-2024",
        provider: '2',
      ),
    ],
    review: "5.0",
  )
];

