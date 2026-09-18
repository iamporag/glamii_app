import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glamii_app/controller/reward_controller.dart';
import 'package:glamii_app/util/dimensions.dart';
import 'package:glamii_app/util/styles.dart';

class RewardsWalletScreen extends StatelessWidget {
  const RewardsWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: GetBuilder<RewardController>(builder: (controller) {
        return Column(
          children: [
            // ==== Current Balance ====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(
                    Dimensions.RADIUS_EXTRA_LARGE * 2,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Current Balance',
                      style: giazaStencilBlack.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: theme.cardColor,
                      )),
                  const SizedBox(height: 8),
                  Obx(() => Text(controller.totalPoints.value.toString(),
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ==== Reward Activities ====
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.red));
                }

                if (controller.activityList.isEmpty) {
                  return const Center(child: Text("No activities found"));
                }

                return ListView.builder(
                  itemCount: controller.activityList.length,
                  itemBuilder: (context, index) {
                    final activity = controller.activityList[index];
                    final activityType = activity['activity']!;
                    final color = activityType == 'Earned Points'
                        ? Colors.green
                        : activityType == 'Redeemed Points'
                            ? Colors.red
                            : Colors.grey;

                    return ListTile(
                      leading: Icon(
                        activityType == 'Earned Points'
                            ? Icons.add_circle
                            : activityType == 'Redeemed Points'
                                ? Icons.remove_circle
                                : Icons.warning,
                        color: color,
                      ),
                      title: Text(
                        activityType,
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
              }),
            ),
          ],
        );
      }),
    );
  }
}
