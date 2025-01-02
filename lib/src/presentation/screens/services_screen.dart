// import 'package:flutter/material.dart';

// class ServicesScreen extends StatelessWidget {
//   // Dummy data for service categories and services within each category
//   final Map<String, List<Map<String, String>>> servicesByCategory = {
//     'Hair': [
//       {'name': 'Haircut', 'imageUrl': 'https://images.pexels.com/photos/3356170/pexels-photo-3356170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
//       {'name': 'Hair Coloring', 'imageUrl': 'https://images.pexels.com/photos/8468036/pexels-photo-8468036.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
//       {'name': 'Hair Styling', 'imageUrl': 'https://images.pexels.com/photos/20781299/pexels-photo-20781299/free-photo-of-blonde-woman-with-long-hair.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
//     ],
//     'Spa': [
//       {'name': 'Full Body Massage', 'imageUrl': 'https://images.pexels.com/photos/6629538/pexels-photo-6629538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
//       {'name': 'Facial Treatment', 'imageUrl': 'https://images.pexels.com/photos/3738349/pexels-photo-3738349.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
//       {'name': 'Aromatherapy', 'imageUrl': 'https://images.pexels.com/photos/672051/pexels-photo-672051.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
//     ],
//     'Makeup': [
//       {'name': 'Bridal Makeup', 'imageUrl': 'https://images.pexels.com/photos/1229414/pexels-photo-1229414.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
//       {'name': 'Party Makeup', 'imageUrl': 'https://images.pexels.com/photos/7312413/pexels-photo-7312413.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
//       {'name': 'Everyday Look', 'imageUrl': 'https://images.pexels.com/photos/9558250/pexels-photo-9558250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Services',
//           style: TextStyle(
//             fontFamily: 'GiazaStencil',
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Color(0xFF75140C),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: servicesByCategory.entries.map((category) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Category Title
//                   Text(
//                     category.key,
//                     style: TextStyle(
//                       fontFamily: 'GiazaStencil',
//                       fontSize: 20,
//                       color: Color(0xFF75140C),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   // Grid of Services
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: category.value.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10,
//                       childAspectRatio: 3 / 4,
//                     ),
//                     itemBuilder: (context, index) {
//                       final service = category.value[index];
//                       return GestureDetector(
//                         onTap: () {
//                           // Navigate to service details screen (placeholder)
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.3),
//                                 spreadRadius: 3,
//                                 blurRadius: 5,
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               // Service Image
//                               ClipRRect(
//                                 borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                                 child: Image.network(
//                                   service['imageUrl']!,
//                                   height: 100,
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               // Service Name
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   service['name']!,
//                                   style: TextStyle(
//                                     fontFamily: 'TTChocolates',
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFF75140C),
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   SizedBox(height: 16),
//                 ],
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }












// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  // Dummy service data
  final List<Map<String, String>> services = [
    {
      'title': 'Haircut',
      'description': 'A fresh haircut to make you look your best.',
      'price': '\$25',
      'duration': '30 mins',
      'image': 'https://images.pexels.com/photos/3356170/pexels-photo-3356170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Replace with actual image path
    },
    {
      'title': 'Facial Treatment',
      'description': 'Rejuvenate your skin with a luxurious facial treatment.',
      'price': '\$40',
      'duration': '45 mins',
      'image': 'https://images.pexels.com/photos/3738349/pexels-photo-3738349.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      'title': 'Massage',
      'description': 'Relax your body with a soothing massage.',
      'price': '\$60',
      'duration': '60 mins',
      'image': 'https://images.pexels.com/photos/3764568/pexels-photo-3764568.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Services',
          style: TextStyle(
            fontFamily: 'GiazaStencil',
            color: Colors.white,
          ),
        ),
        backgroundColor:const Color(0xFF75140C),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(services[index]['image']!),
            ),
            title: Text(
              services[index]['title']!,
              style: const TextStyle(
                fontFamily: 'GiazaStencil',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              services[index]['description']!,
              style: TextStyle(
                fontFamily: 'TTChocolates',
                fontSize: 14,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Service Details Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDetailScreen(service: services[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ServiceDetailScreen extends StatelessWidget {
  final Map<String, String> service;

  const ServiceDetailScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          service['title']!,
          style: const TextStyle(
            fontFamily: 'GiazaStencil',
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF75140C),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Image
            Center(
              child: Image.network(
                service['image']!,
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Service Title
            Text(
              service['title']!,
              style: const TextStyle(
                fontFamily: 'GiazaStencil',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF75140C),
              ),
            ),
            const SizedBox(height: 8),
            // Service Price and Duration
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Price: ${service['price']}',
                  style:const TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'Duration: ${service['duration']}',
                  style: const TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Service Description
            Text(
              service['description']!,
              style: TextStyle(
                fontFamily: 'TTChocolates',
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            // Booking Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF75140C),
                  padding:const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Navigate to booking screen
                },
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    fontFamily: 'GiazaStencil',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
