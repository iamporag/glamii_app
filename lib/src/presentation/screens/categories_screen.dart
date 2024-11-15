import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  // Sample data for categories
  final List<Map<String, String>> categories = [
    {
      'name': 'Hair Care & Styling',
      'imageUrl':
          'https://images.pexels.com/photos/3356170/pexels-photo-3356170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Spa & Relaxation',
      'imageUrl':
          'https://images.pexels.com/photos/6629538/pexels-photo-6629538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Makeup Artistry',
      'imageUrl':
          'https://images.pexels.com/photos/7312413/pexels-photo-7312413.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Nail Art & Design',
      'imageUrl':
          'https://images.pexels.com/photos/887352/pexels-photo-887352.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'SkinCare & Treatments',
      'imageUrl':
          'https://images.pexels.com/photos/3762871/pexels-photo-3762871.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Massage & Body Care',
      'imageUrl':
          'https://images.pexels.com/photos/3764568/pexels-photo-3764568.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(
            fontFamily: 'GiazaStencil',
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF75140C),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 16/9
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                // Navigate to a ServicesScreen for the specific category
                // Pass the category name or ID as an argument (currently placeholder)
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Category Image

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        category['imageUrl']!,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        category['name']!,
                        style: const TextStyle(
                          fontFamily: 'TTChocolates',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
