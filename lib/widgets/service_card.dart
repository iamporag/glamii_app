import 'package:flutter/material.dart';

import 'featured_services_screen.dart';

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final Function() onTap;
  final Map<String, String> service;

  const ServiceCard(
      {super.key,
      required this.service,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'GiazaStencil',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF75140C),
                      ),
                    ),
                    Text(
                      description,
                      maxLines: 2,
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
      ),
    );
  }
}
