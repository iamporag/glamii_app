import 'package:flutter/material.dart';
import 'package:glamii_app/widgets/featured_services_screen.dart';

class ProviderBusinessPage extends StatelessWidget {
  // Sample data for a provider's business page
  final Map<String, String> providerInfo = {
    'name': 'Luxury Salon & Spa',
    'description':
        'An award-winning salon offering a range of beauty treatments designed for ultimate relaxation and rejuvenation.',
    'bannerImage':
        'https://images.pexels.com/photos/7195802/pexels-photo-7195802.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'contactNumber': '+1 234 567 890',
    'address': '123 Beauty Ave, Glamour City',
  };

  final List<Map<String, String>> availableServices = [
    {'title': 'Facial Treatment', 'price': '50'},
    {'title': 'Haircut & Styling', 'price': '30'},
    {'title': 'Manicure & Pedicure', 'price': '20'},
    {'title': 'Full Body Massage', 'price': '70'},
  ];

  final List<Map<String, String>> reviews = [
    {
      'user': 'Alice',
      'review':
          'Amazing service! The staff was friendly, and I loved my haircut.',
      'date': '2024-11-01'
    },
    {
      'user': 'John',
      'review':
          'Very relaxing experience. Highly recommend their spa treatments.',
      'date': '2024-10-28'
    },
    {
      'user': 'Maria',
      'review': 'Professional and clean environment. Will definitely return!',
      'date': '2024-10-20'
    },
  ];

  final List<Map<String, String>> featuredServices = [
    {
      'imageUrl':
          'https://images.pexels.com/photos/19641830/pexels-photo-19641830/free-photo-of-woman-lying-on-a-massage-table-and-getting-a-massage.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Luxury Spa Treatment',
      'description': 'Relax and rejuvenate with our exclusive spa treatment.',
      'price': '\$25',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/18186520/pexels-photo-18186520/free-photo-of-hairdresser-cutting-hairs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Professional Hair Styling',
      'description': 'Get a stunning new look with our top stylists.',
      'price': '\$25',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/15530661/pexels-photo-15530661/free-photo-of-beautician-putting-make-up-on-a-customer-face.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Makeup Artistry',
      'description': 'Perfect your look with a professional makeup session.',
      'price': '\$25',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/4677856/pexels-photo-4677856.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Nail Art & Manicure',
      'description':
          'Get creative with customized nail art and a relaxing manicure.',
      'price': '\$25',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/29151228/pexels-photo-29151228/free-photo-of-young-woman-applying-mascara-close-up-shot.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Personalized Skincare',
      'description':
          'Experience skincare tailored to your skin type and needs.',
      'price': '\$25',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/14253964/pexels-photo-14253964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Massage Therapy',
      'description':
          'Unwind with a full-body massage to relieve stress and tension.',
      'price': '\$25',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/8826403/pexels-photo-8826403.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Eyebrow Shaping',
      'description':
          'Enhance your features with expert eyebrow shaping services.',
      'price': '\$25',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/5304839/pexels-photo-5304839.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Bridal Package',
      'description': 'Complete bridal beauty package for your special day.',
      'price': '\$25',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/5240819/pexels-photo-5240819.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Anti-Aging Facial',
      'description':
          'Rejuvenate with our specialized anti-aging facial treatment.',
      'price': '\$25',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/28994645/pexels-photo-28994645/free-photo-of-applying-hair-spray-to-long-red-hair-indoors.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Hair Coloring',
      'description':
          'Refresh or reinvent your style with expert hair coloring.',
      'price': '\$25',
      'duration': '30 mins',
    },
    // Add more services as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          providerInfo['name']!,
          style: const TextStyle(
            fontFamily: 'GiazaStencil',
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF75140C),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Provider Banner
            Image.network(
              providerInfo['bannerImage']!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Provider Name & Description
                ListTile(
                  title: Text(
                  providerInfo['name']!,
                  style: const TextStyle(
                    fontFamily: 'GiazaStencil',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF75140C),
                  ),
                ),
                subtitle: Text(
                  providerInfo['description']!,
                  style: const TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                ),
                // Available Services
                TitleWidget(title: "Available Services"),
                // Column(
                //   children: availableServices.map((service) {
                //     return ListTile(
                //       title: Text(
                //         service['title']!,
                //         style: TextStyle(
                //           fontFamily: 'TTChocolates',
                //           fontSize: 16,
                //           color: Colors.black,
                //         ),
                //       ),
                //       trailing: Text(
                //         '\$${service['price']}',
                //         style: TextStyle(
                //           fontFamily: 'TTChocolates',
                //           fontSize: 16,
                //           color: Color(0xFF75140C),
                //         ),
                //       ),
                //     );
                //   }).toList(),
                // ),
                FeatureServiceArea(featuredServices: featuredServices),
               
                // Contact Information
                TitleWidget(title: 'Contact Information',),
               
                ListTile(
                  leading: Icon(Icons.phone, color: Color(0xFF75140C)),
                  title: Text(
                    providerInfo['contactNumber']!,
                    style: TextStyle(
                      fontFamily: 'TTChocolates',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on, color: Color(0xFF75140C)),
                  title: Text(
                    providerInfo['address']!,
                    style: const TextStyle(
                      fontFamily: 'TTChocolates',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
               
                // Customer Reviews
                TitleWidget(title: 'Customer Reviews',),
              
                Column(
                  children: reviews.map((review) {
                    return ListTile(
                      title: Text(
                        review['user']!,
                        style: const TextStyle(
                          fontFamily: 'TTChocolates',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        '${review['review']} - ${review['date']}',
                        style: TextStyle(
                          fontFamily: 'TTChocolates',
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      leading: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
