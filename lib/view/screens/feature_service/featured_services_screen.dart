// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glamii_app/util/dimensions.dart';
import 'package:glamii_app/util/styles.dart';
import 'package:glamii_app/view/screens/feature_service/widgets/home_appbar.dart';
import 'package:shimmer/shimmer.dart';

import '../../../theme/light_theme.dart';
import '../rewards/rewards_wallet_screen.dart';
import 'widgets/featured_service_detail_screen.dart';
import '../rewards/widgets/service_card.dart';

class FeaturedServicesScreen extends StatelessWidget {
  FeaturedServicesScreen({super.key});
  final List<Map<String, String>> featuredServices = [
    {
      'imageUrl':
          'https://images.pexels.com/photos/6621070/pexels-photo-6621070.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Luxury Spa Treatment',
      'description': 'Relax and rejuvenate with our exclusive spa treatment.',
      'price': '\$25',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/3993447/pexels-photo-3993447.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Professional Hair Styling',
      'description':
          'Transform your look with expert cuts and styles suited to your personality.',
      'price': '\$35',
      'duration': '45 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/3997990/pexels-photo-3997990.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Makeup Artistry',
      'description': 'Perfect your look with a professional makeup session.',
      'price': '\$40',
      'duration': '1 hour',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/8534278/pexels-photo-8534278.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Nail Art & Manicure',
      'description':
          'Get creative with customized nail art and a relaxing manicure.',
      'price': '\$20',
      'duration': '40 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/6621445/pexels-photo-6621445.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Personalized Skincare',
      'description':
          'Experience skincare tailored to your skin type and needs.',
      'price': '\$30',
      'duration': '30 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/3865792/pexels-photo-3865792.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Massage Therapy',
      'description':
          'Unwind with a full-body massage to relieve stress and tension.',
      'price': '\$45',
      'duration': '1 hour',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/8534276/pexels-photo-8534276.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Eyebrow Shaping',
      'description': 'Enhance your features with expert eyebrow shaping.',
      'price': '\$15',
      'duration': '20 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/8534081/pexels-photo-8534081.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Bridal Package',
      'description': 'Complete bridal beauty package for your special day.',
      'price': '\$120',
      'duration': '3 hours',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/3738346/pexels-photo-3738346.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Anti-Aging Facial',
      'description':
          'Rejuvenate with our specialized anti-aging facial treatment.',
      'price': '\$35',
      'duration': '45 mins',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/3993449/pexels-photo-3993449.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'Hair Coloring',
      'description':
          'Refresh or reinvent your style with expert hair coloring.',
      'price': '\$50',
      'duration': '1.5 hours',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: const HomeAppbar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeaturedServicesCarousel(
                featuredServices: featuredServices,
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
  final Map<String, String> service;

  const FeaturedServiceCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Get.isDarkMode;
    final imageUrl = service['imageUrl'] ?? '';
    final title = service['title'] ?? '';
    final description = service['description'] ?? '';

    return GestureDetector(
      onTap: () {},
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: 1.0,
        child: Container(
          width: 220,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.45)
                    : Colors.blueGrey.withOpacity(0.15),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Image with shimmer & glass overlay title ---
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(Dimensions.RADIUS_DEFAULT),
                      ),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(color: Colors.grey[300]),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.image_not_supported,
                              color: Colors.grey, size: 40),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          color: Colors.black.withOpacity(0.35),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // --- Description & Review Section ---
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'TTChocolates',
                        fontSize: 13,
                        height: 1.4,
                        color: isDark
                            ? theme.textTheme.bodyMedium?.color
                            : AppColor.darkBlueColor.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 6),
                    ServiceReviewRow(service: service),
                  ],
                ),
              ),
            ],
          ),
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
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price: ${service['price']}',
          style: bodyMediumText(context)?.copyWith(
            color: Get.isDarkMode
                ? theme.textTheme.displayLarge?.color
                : AppColor.darkBlueColor,
          ),
          textAlign: TextAlign.center,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            const Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            const Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            const Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            const Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
            Text(
              '(5k)',
              style: bodyMediumText(context)?.copyWith(
                color: Get.isDarkMode
                    ? theme.textTheme.displayLarge?.color
                    : AppColor.darkBlueColor,
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
              color: Get.isDarkMode
                  ? theme.textTheme.displayLarge?.color
                  : AppColor.primary,
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

class FeaturedServicesCarousel extends StatelessWidget {
  final List<Map<String, String>> featuredServices;

  const FeaturedServicesCarousel({
    super.key,
    required this.featuredServices,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = 260.0;

    return CarouselSlider.builder(
      itemCount: featuredServices.length,
      itemBuilder: (context, index, realIndex) {
        final service = featuredServices[index];
        final imageUrl = service['imageUrl'] ?? '';
        final title = service['title'] ?? '';
        final description = service['description'] ?? '';
        final price = service['price'] ?? 'N/A';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () {
              // TODO: Implement full preview screen with Hero animation
            },
            child: Hero(
              tag: '${service['imageUrl']}_$index',
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE),
                child: Stack(
                  children: [
                    // ---- Background Image ----
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      child: Image.network(
                        imageUrl,
                        width: screenWidth,
                        height: screenHeight,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: screenWidth,
                            height: screenHeight,
                            color: Colors.grey[300],
                          );
                        },
                        errorBuilder: (context, error, stack) => Container(
                          color: Colors.grey.shade200,
                          alignment: Alignment.center,
                          child: const Icon(Icons.image_not_supported,
                              size: 40, color: Colors.grey),
                        ),
                      ),
                    ),

                    // ---- Gradient Overlay ----
                    Container(
                      height: screenHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Get.isDarkMode
                                ? theme.cardColor.withOpacity(0.95)
                                : AppColor.blackColor.withOpacity(0.85),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    // ---- Discount Badge ----
                    Positioned(
                      top: 20,
                      right: 0,
                      child: Container(
                        height: 36,
                        width: screenWidth / 4,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.amber, Colors.orangeAccent],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Upto ",
                              style: giazaStencilMedium.copyWith(
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "50% 🔥",
                                  style: giazaStencilBlack.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ---- Bottom Details ----
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding:
                            const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // -- “Get Discount” Banner --
                            Row(
                              children: [
                                Container(
                                  width: 5,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade700,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  width: screenWidth / 4,
                                  height: 28,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.amber, Colors.orange],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Get Discount",
                                      style: giazaStencilBlack.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),

                            // -- Title & Description --
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: screenWidth / 1.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: giazaStencilBlack.copyWith(
                                        fontSize:
                                            Dimensions.FONT_SIZE_LARGE + 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      'Price: $price',
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color: Colors.amberAccent,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),

                                    // Stars
                                    const Row(
                                      children: [
                                        Icon(Icons.star,
                                            size: 14, color: Colors.amber),
                                        Icon(Icons.star,
                                            size: 14, color: Colors.amber),
                                        Icon(Icons.star,
                                            size: 14, color: Colors.amber),
                                        Icon(Icons.star,
                                            size: 14, color: Colors.amber),
                                        Icon(Icons.star,
                                            size: 14, color: Colors.amber),
                                        SizedBox(width: 4),
                                        Text(
                                          '(5k)',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'TTChocolates',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 260,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
