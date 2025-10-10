// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:glamii_app/util/app_constants.dart';
import 'package:glamii_app/util/dimensions.dart';
import 'package:glamii_app/util/styles.dart';

import '../notification/notifications_screen.dart';
import '../rewards/rewards_wallet_screen.dart';
import 'widgets/featured_service_detail_screen.dart';
import '../rewards/widgets/service_card.dart';

class FeaturedServicesScreen extends StatelessWidget {
  FeaturedServicesScreen({super.key});
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
      'description':
          """A professional hairstyle is more than just a haircut—it's an expression of personality, a reflection of confidence, and a statement of elegance. At our salon, we believe that the right hairstyle can transform not just your look, but your entire mood and outlook. Our team of expert stylists combines their extensive training with a keen eye for trends and timeless techniques to deliver exceptional results. From sleek, sophisticated cuts to voluminous waves, we offer a wide range of styles tailored to your unique hair type, face shape, and lifestyle needs. Whether you're preparing for a special occasion or just need a fresh, everyday look, our stylists are committed to making you feel beautiful and empowered.

Each consultation begins with a personal discussion about your hair goals, lifestyle, and maintenance preferences. We use only high-quality products to ensure your hair not only looks great but remains healthy and vibrant. Our services range from precision cuts and color treatments to extensions, balayage, and keratin treatments. We take into account the latest trends while also focusing on styles that work best for your hair texture and face shape.

Experience a professional haircut that goes beyond expectations, offering a tailored experience that suits you. Whether it's a short bob, long layers, or a bold pixie cut, our stylists take the time to ensure you walk out of our salon with a look you love, all while maintaining the health and integrity of your hair. Elevate your appearance with the perfect professional hairstyle that complements your individual beauty.""",
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
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppConstants.APP_NAME,
            style: giazaStencilBold.copyWith(
              color: theme.cardColor,
            ),
          ),
          backgroundColor: theme.primaryColor,
          actions: [
            const RewardPoint(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  "Hello, Emma Oliver!",
                  style: giazaStencilBlack.copyWith(
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: theme.primaryColor,
                  ),
                ),
                subtitle: Text(
                  "Welcome to Glamii App",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              CarouselSlider.builder(
                itemCount: featuredServices.length,
                itemBuilder: (context, index, realIndex) {
                  final service = featuredServices[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                          child: Image.network(
                            service['imageUrl']!,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.RADIUS_DEFAULT),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                            ),
                            child: Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width / 4.2,
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100)),
                              ),
                              child: Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: "Upto ",
                                          style: giazaStencilMedium.copyWith(
                                            color: theme.primaryColor,
                                          ),
                                          children: [
                                    TextSpan(
                                      text: "50% 🔥",
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color: theme.primaryColor,
                                      ),
                                    ),
                                  ]))),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(
                                Dimensions.PADDING_SIZE_SMALL),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 30,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          4.2,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(100),
                                          bottomRight: Radius.circular(100),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Get Discount",
                                          style: giazaStencilBlack.copyWith(
                                            color: theme.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(service['title']!,
                                          style: giazaStencilBlack.copyWith(
                                            fontSize: 20,
                                            color: Colors.white,
                                          )),
                                      Text(
                                        service['description']!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: theme.cardColor,
                                        ),
                                      ),
                                      Text(
                                        'Price: ${service['price']}',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: theme.cardColor,
                                        ),
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.amber,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '(5k)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'TTChocolates',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 9 / 6,
                  viewportFraction: 0.9,
                  initialPage: 0,
                ),
              ),
              const SizedBox(
                height: Dimensions.FREE_SIZE_DEFAULT,
              ),
              TitleWidget(
                title: "Featured Services",
                trailing: "View All",
                onTap: () {},
              ),
              const SizedBox(
                height: Dimensions.FREE_SIZE_SMALL,
              ),
              FeatureServiceArea(featuredServices: featuredServices),
              const SizedBox(
                height: Dimensions.FREE_SIZE_DEFAULT,
              ),
              AllServicesArea(featuredServices: featuredServices),
            ],
          ),
        ));
  }
}

class RewardPoint extends StatelessWidget {
  const RewardPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // context.read<PointsBloc>().add(CalculatePointsEvent());

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RewardsWalletScreen(),
          ),
        );
      },
      icon: const Row(
        children: [
          // BlocBuilder<PointsBloc, PointsState>(
          //   builder: (context, state) {
          //     if (state is PointsInitial) {
          //       return Text(
          //         "0 Point",
          //         style: Theme.of(context)
          //             .textTheme
          //             .titleSmall
          //             ?.copyWith(color: Colors.white),
          //       );
          //     } else if (state is PointsCalculatedState) {
          //       return Text(
          //         state.totalPoints.toString() + " Points",
          //         style: Theme.of(context)
          //             .textTheme
          //             .titleSmall
          //             ?.copyWith(color: Colors.white),
          //       );
          //     } else {
          //       return const CircularProgressIndicator();
          //     }
          //   },
          // ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.local_police_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class AllServicesArea extends StatelessWidget {
  const AllServicesArea({
    super.key,
    required this.featuredServices,
  });

  final List<Map<String, String>> featuredServices;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(title: "Explore our services"),
        ListView.separated(
          shrinkWrap:
              true, // To make the ListView take only as much space as needed
          physics:
              const NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
          itemCount: featuredServices.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: Dimensions.FREE_SIZE_SMALL);
          },
          itemBuilder: (context, index) {
            final service = featuredServices[index];
            return ServiceCard(
              imageUrl: service['imageUrl']!,
              title: service['title']!,
              description: service['description']!,
              onTap: () {
                // Navigate to the FeaturedServiceDetailScreen for the selected service
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeaturedServiceDetailScreen(
                      service: featuredServices[index],
                    ),
                  ),
                );
              },
              service: service,
            );
          },
        ),
      ],
    );
  }
}

class FeatureServiceArea extends StatelessWidget {
  const FeatureServiceArea({
    super.key,
    required this.featuredServices,
  });

  final List<Map<String, String>> featuredServices;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT),
        child: Row(
            children: List.generate(
          featuredServices.length,
          (index) {
            final service = featuredServices[index];
            return FeaturedServiceCard(service: service);
          },
        )),
      ),
    );
  }
}

class FeaturedServiceCard extends StatelessWidget {
  const FeaturedServiceCard({
    super.key,
    required this.service,
  });

  final Map<String, String> service;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Dimensions.RADIUS_DEFAULT),
                topRight: Radius.circular(Dimensions.RADIUS_DEFAULT),
              ),
              child: Image.network(
                service['imageUrl']!,
                height: 90,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service['title']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'GiazaStencil',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF75140C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    service['description']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'TTChocolates',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  ServiceReviewRow(service: service),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceReviewRow extends StatelessWidget {
  const ServiceReviewRow({
    super.key,
    required this.service,
  });

  final Map<String, String> service;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price: ${service['price']}',
          style: const TextStyle(
            fontFamily: 'TTChocolates',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const Row(
          children: [
            Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            Text(
              '(5k)',
              style: TextStyle(
                fontFamily: 'TTChocolates',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String title;
  final String? trailing;
  final VoidCallback? onTap;
  const TitleWidget({
    super.key,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_DEFAULT),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: giazaStencilBlack.copyWith(
              color: theme.primaryColor,
            ),
          ),
          trailing != null
              ? GestureDetector(
                  onTap: () {
                    onTap;
                  },
                  child: Text(
                    trailing ?? '',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
