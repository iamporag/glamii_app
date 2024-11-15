import 'package:flutter/material.dart';
import 'package:glamii_app/src/presentation/screens/provider_business_page.dart';
import 'package:glamii_app/widgets/featured_services_screen.dart';
import 'package:readmore/readmore.dart';

class FeaturedServiceDetailScreen extends StatelessWidget {
  final Map<String, String> service;

  const FeaturedServiceDetailScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Image
            Image.network(
              service['imageUrl']!,
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service['title']!,
                    style: const TextStyle(
                      fontFamily: 'GiazaStencil',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF75140C),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProviderBusinessPage()));
                    },
                    child: const Text(
                      "Luxury Salon & Spa",
                      style: TextStyle(
                        fontFamily: 'GiazaStencil',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF75140C),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Service Price and Duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Price: ${service['price']}',
                        style: const TextStyle(
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

                  ReadMoreText(
                    service['description']!,
                    style: TextStyle(
                      fontFamily: 'TTChocolates',
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    trimLines: 5,
                    moreStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                    lessStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                    trimCollapsedText: 'Show More',
                    trimExpandedText: 'Show Less',
                  ),
                  // Text(
                  //   service['description']!,
                  //   style: TextStyle(
                  //     fontFamily: 'TTChocolates',
                  //     fontSize: 16,
                  //     color: Colors.grey[600],
                  //   ),
                  // ),
                ],
              ),
            ),

            // Service Title
            const SizedBox(
              height: 20,
            ),
            const TitleWidget(
              title: "Review",
              trailing: Text("View All (12)"),
            ),

            const ListTile(
              title: Text("Emma R. ⭐⭐⭐⭐⭐"),
              subtitle: Text(
                  """Absolutely love my new haircut! The stylist took the time to really understand what I wanted, and the result exceeded my expectations. The cut is stylish, easy to maintain, and suits my face shape perfectly. Highly recommend this salon!"""),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Image.network(
                        "https://images.pexels.com/photos/3065208/pexels-photo-3065208.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Image.network(
                        "https://images.pexels.com/photos/3993443/pexels-photo-3993443.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text("Emma R. ⭐⭐⭐⭐⭐"),
              subtitle: Text(
                  """Absolutely love my new haircut! The stylist took the time to really understand what I wanted, and the result exceeded my expectations. The cut is stylish, easy to maintain, and suits my face shape perfectly. Highly recommend this salon!"""),
            ),
            const ListTile(
              title: Text("Emma R. ⭐⭐⭐⭐⭐"),
              subtitle: Text(
                  """Absolutely love my new haircut! The stylist took the time to really understand what I wanted, and the result exceeded my expectations. The cut is stylish, easy to maintain, and suits my face shape perfectly. Highly recommend this salon!"""),
            ),
            const ListTile(
              title: Text("Emma R. ⭐⭐⭐⭐⭐"),
              subtitle: Text(
                  """Absolutely love my new haircut! The stylist took the time to really understand what I wanted, and the result exceeded my expectations. The cut is stylish, easy to maintain, and suits my face shape perfectly. Highly recommend this salon!"""),
            ),
            const ListTile(
              title: Text("Emma R. ⭐⭐⭐⭐⭐"),
              subtitle: Text(
                  """Absolutely love my new haircut! The stylist took the time to really understand what I wanted, and the result exceeded my expectations. The cut is stylish, easy to maintain, and suits my face shape perfectly. Highly recommend this salon!"""),
            ),
            const ListTile(
              title: Text("Emma R. ⭐⭐⭐⭐⭐"),
              subtitle: Text(
                  """Absolutely love my new haircut! The stylist took the time to really understand what I wanted, and the result exceeded my expectations. The cut is stylish, easy to maintain, and suits my face shape perfectly. Highly recommend this salon!"""),
            ),
            const ListTile(
              title: Text("Emma R. ⭐⭐⭐⭐⭐"),
              subtitle: Text(
                  """Absolutely love my new haircut! The stylist took the time to really understand what I wanted, and the result exceeded my expectations. The cut is stylish, easy to maintain, and suits my face shape perfectly. Highly recommend this salon!"""),
            ),

            // Booking Button
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF75140C),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // Handle booking functionality here
              // Navigate to booking screen or show confirmation dialog
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
      ),
    );
  }
}
