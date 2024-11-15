// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glamii_app/src/bloc/bloc/points_bloc.dart';

class RewardsWalletScreen extends StatelessWidget {
  const RewardsWalletScreen({super.key});

  // Dummy data for reward activities
  // final List<Map<String, String>> rewardActivities = [
  //   {
  //     'date': '2024-11-01',
  //     'activity': 'Earned Points',
  //     'points': '+150',
  //     'description': 'For booking Luxury Spa Treatment'
  //   },
  //   {
  //     'date': '2024-10-28',
  //     'activity': 'Redeemed Points',
  //     'points': '-100',
  //     'description': 'Redeemed for a discount on Hair Styling'
  //   },
  //   {
  //     'date': '2024-10-20',
  //     'activity': 'Earned Points',
  //     'points': '+200',
  //     'description': 'For referring a friend'
  //   },
  //   {
  //     'date': '2024-10-15',
  //     'activity': 'Expired Points',
  //     'points': '-50',
  //     'description': 'Points expired'
  //   },
  //   {
  //     'date': '2024-10-10',
  //     'activity': 'Earned Points',
  //     'points': '+200',
  //     'description': 'Signup Bonus'
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rewards Wallet',
          style: TextStyle(
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
      body: Column(
        children: [
          // Current Balance Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: const BoxDecoration(
              color: Color(0xFF75140C),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Current Balance',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                BlocBuilder<PointsBloc, PointsState>(
                  builder: (context, state) {
                    if (state is PointsInitial) {
                      return const Text(
                        "0",
                        style: TextStyle(
                          fontFamily: 'GiazaStencil',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    } else if (state is PointsCalculatedState) {
                      return Text(
                        "${state.totalPoints.toString()}",
                        style: const TextStyle(
                          fontFamily: 'GiazaStencil',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Rewards Activity Section
          BlocProvider(
            create: (context) => PointsBloc()..add(LoadRewardActivitiesEvent()),
            child: Expanded(child: BlocBuilder<PointsBloc, PointsState>(
              builder: (context, state) {
                if (state is RewardActivitiesLoadedState) {
                  return ListView.builder(
                    itemCount: state.rewardActivities.length,
                    itemBuilder: (context, index) {
                      final activity = state.rewardActivities[index];
                      return ListTile(
                        leading: Icon(
                          activity['activity'] == 'Earned Points'
                              ? Icons.add_circle
                              : activity['activity'] == 'Redeemed Points'
                                  ? Icons.remove_circle
                                  : Icons.warning,
                          color: activity['activity'] == 'Earned Points'
                              ? Colors.green
                              : activity['activity'] == 'Redeemed Points'
                                  ? Colors.red
                                  : Colors.grey,
                        ),
                        title: Text(
                          activity['activity']!,
                          style: const TextStyle(
                            fontFamily: 'TTChocolates',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          '${activity['date']} - ${activity['description']}',
                          style: TextStyle(
                            fontFamily: 'TTChocolates',
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        trailing: Text(
                          activity['points']!,
                          style: const TextStyle(
                            fontFamily: 'TTChocolates',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                }
              },
            )),
          )
        ],
      ),
    );
  }
}
