import 'package:flutter/material.dart';
import 'package:glamii_app/util/dimensions.dart';
import 'package:glamii_app/util/styles.dart';
import 'package:glamii_app/view/base/custom_app_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeaturedServiceDetailScreen extends StatefulWidget {
  final Map<String, dynamic> service;

  const FeaturedServiceDetailScreen({super.key, required this.service});

  @override
  State<FeaturedServiceDetailScreen> createState() =>
      _FeaturedServiceDetailScreenState();
}

class _FeaturedServiceDetailScreenState
    extends State<FeaturedServiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final service = widget.service;
    final theme = Theme.of(context);
    final Map<String, dynamic> nailArtService = {
      'title': 'Nail Art & Manicure',
      'description':
          'Get creative with customized nail art and a relaxing manicure.',
      'price': '\$20',
      'duration': '40 mins',
      'images': [
        'https://images.pexels.com/photos/3065171/pexels-photo-3065171.jpeg',
        'https://images.pexels.com/photos/2799605/pexels-photo-2799605.jpeg',
        'https://images.pexels.com/photos/3331486/pexels-photo-3331486.jpeg',
        'https://images.pexels.com/photos/3993467/pexels-photo-3993467.jpeg',
        'https://images.pexels.com/photos/3993324/pexels-photo-3993324.jpeg',
      ],
    };

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Service Detail',
        isBackButtonExist: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel with Fullscreen Tap
            FeaturedServiceGallery(
                images: nailArtService['images']!.cast<String>()),

            // Info Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoTitleText(service['title'] ?? 'Service Title'),
                  const SizedBox(height: Dimensions.FREE_SIZE_DEFAULT),
                  // Price & Duration Card
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoIconText(
                            Icons.attach_money, service['price'] ?? '\$40'),
                        _infoIconText(
                            Icons.access_time, service['duration'] ?? '1h 30m'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  const Text(
                    "About This Service",
                    style: TextStyle(
                      fontFamily: 'GiazaStencil',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ReadMoreText(
                    service['description'] ?? 'No description available.',
                    trimLines: 4,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read More',
                    trimExpandedText: 'Read Less',
                    style: const TextStyle(fontSize: 15, height: 1.5),
                    moreStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.calendar_today, color: Colors.white),
          label: const Text(
            'Book Now',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            backgroundColor: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
          ),
        ),
      ),
    );
  }

  Widget _infoIconText(IconData icon, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 6),
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      ],
    );
  }

  Widget _infoTitleText(String title) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.clip,
      style: bodyMediumText(context)!.copyWith(
        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
        fontWeight: FontWeight.w700,
        height: 1.3,
        letterSpacing: 0.5,
      ),
    );
  }
}

// Full Screen Image Viewer WITHOUT HERO
class _FullScreenImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const _FullScreenImageViewer({
    required this.images,
    this.initialIndex = 0,
  });

  @override
  State<_FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<_FullScreenImageViewer> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) => InteractiveViewer(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: widget.images[index],
                  fit: BoxFit.contain,
                  placeholder: (_, __) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (_, __, ___) => const Icon(Icons.broken_image,
                      size: 60, color: Colors.grey),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          if (widget.images.length > 1)
            Positioned(
              bottom: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: currentIndex == index ? 10 : 6,
                    height: currentIndex == index ? 10 : 6,
                    decoration: BoxDecoration(
                      color:
                          currentIndex == index ? Colors.white : Colors.white54,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class FeaturedServiceGallery extends StatefulWidget {
  final List<String> images;

  const FeaturedServiceGallery({super.key, required this.images});

  @override
  State<FeaturedServiceGallery> createState() => _FeaturedServiceGalleryState();
}

class _FeaturedServiceGalleryState extends State<FeaturedServiceGallery> {
  late String mainImage;

  @override
  void initState() {
    super.initState();
    mainImage = widget.images.isNotEmpty ? widget.images[0] : '';
  }

  @override
  Widget build(BuildContext context) {
    final List<String> smallImages = widget.images.length > 1
        ? widget.images.sublist(1, widget.images.length.clamp(1, 5))
        : [];

    return Column(
      children: [
        // Main Image
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => _FullScreenImageViewer(
                  images: widget.images,
                  initialIndex: widget.images.indexOf(mainImage),
                ),
              ),
            );
          },
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl: mainImage,
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                height: 240,
                color: Colors.grey[300],
              ),
              errorWidget: (_, __, ___) => Container(
                  height: 240,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image)),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Small Overlapping Images
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
          child: SizedBox(
            height: 50,
            child: Stack(
              children: smallImages.asMap().entries.map((entry) {
                final index = entry.key;
                final image = entry.value;
                final overlap = index * 40.0; // 40px overlap

                return Positioned(
                  left: overlap,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        mainImage = image;
                      });
                    },
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: image,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => Container(
                          height: 50,
                          width: 50,
                          color: Colors.grey[300],
                        ),
                        errorWidget: (_, __, ___) => Container(
                            height: 50,
                            width: 50,
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image)),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// Full Screen Viewer (No Hero)
class FullScreenImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImageViewer({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  State<_FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class FullScreenImageViewerState extends State<_FullScreenImageViewer> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) => InteractiveViewer(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: widget.images[index],
                  fit: BoxFit.contain,
                  placeholder: (_, __) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (_, __, ___) => const Icon(Icons.broken_image,
                      size: 60, color: Colors.grey),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          if (widget.images.length > 1)
            Positioned(
              bottom: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: currentIndex == index ? 10 : 6,
                    height: currentIndex == index ? 10 : 6,
                    decoration: BoxDecoration(
                      color:
                          currentIndex == index ? Colors.white : Colors.white54,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
