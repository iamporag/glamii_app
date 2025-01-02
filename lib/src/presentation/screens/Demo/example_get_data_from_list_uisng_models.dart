import 'package:flutter/material.dart';
import 'package:glamii_app/src/models/provider_model.dart';

import '../../../utils/dummy_data.dart';

class CompanyScreen extends StatelessWidget {
  final String companyId;

  const CompanyScreen({super.key, required this.companyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Details'),
      ),
      body: FutureBuilder<ProviderModel?>(
        future: Future.delayed(
         const Duration(seconds: 1), // Simulating async data fetching
          () => getProviderById(companyId),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Company not found'));
          }

          final company = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company.providerTitle,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  company.providerDescription,
                  style: const TextStyle(fontSize: 16),
                ),
               const SizedBox(height: 16),
                const Text(
                  'Available Jobs:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: company.availableServices.length,
                    itemBuilder: (context, index) {
                      final job = company.availableServices[index];
                      return ListTile(
                        title: Text(job.serviceTitle),
                        subtitle: Text(job.serviceDescription),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    }
    }