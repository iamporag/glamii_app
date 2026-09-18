import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glamii_app/util/dimensions.dart';

import '../../../theme/light_theme.dart';
import '../../../util/styles.dart';
import '../../base/custom_app_bar.dart';
import '../../base/custom_icon_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Calendar',
        isBackButtonExist: false,
        actions: [
          CustomIconButton(
            onPressed: () {},
            isImage: false,
            iconName: Icons.notifications_outlined,
            iconColor: Get.isDarkMode ? AppColor.cardColor : AppColor.primary,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture
              const TopArea(),
              const SizedBox(height: 16),
              Text(
                'Emma Oliver',
                style: TextStyle(
                  fontFamily: 'GiazaStencil',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode
                      ? AppColor.cardColor
                      : AppColor.splashBlueTittleColor,
                ),
              ),
              Text(
                'emmaoliver@example.com',
                style: TextStyle(
                  fontFamily: 'TTChocolates',
                  fontSize: 16,
                  color: theme.textTheme.bodyLarge!.color,
                ),
              ),

              // Profile Info Section
              Divider(thickness: 0.1, color: theme.dividerColor),
              ProfileItem(theme: theme, title: "edit_profile_key"),
              const SizedBox(height: Dimensions.FREE_SIZE_SMALL),
              ProfileItem(theme: theme, title: "edit_profile_key"),
              const SizedBox(height: Dimensions.FREE_SIZE_SMALL),
              ProfileItem(theme: theme, title: "edit_profile_key"),
              const SizedBox(height: Dimensions.FREE_SIZE_LARGE),
              ListTile(
                leading: const Icon(Icons.person, color: Color(0xFF75140C)),
                title: const Text(
                  'Name',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Emma Oliver',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: const Icon(Icons.edit, color: Color(0xFF75140C)),
                onTap: () {
                  // Navigate to Edit Profile Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.email, color: Color(0xFF75140C)),
                title: const Text(
                  'Email',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'emmaoliver@example.com',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Color(0xFF75140C)),
                title: const Text(
                  'Phone',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '+1 (555) 123-4567',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Divider(thickness: 0.1, color: theme.dividerColor),

              // Action Buttons
              ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFF75140C)),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigate to Settings Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock, color: Color(0xFF75140C)),
                title: const Text(
                  'Privacy',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigate to Privacy Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'TTChocolates',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  // Handle logout action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.theme,
    required this.title,
  });

  final ThemeData theme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
        left: Dimensions.PADDING_SIZE_SMALL,
        bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL,
      ),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
            ),
            child: Center(
              child: Icon(Icons.person_2_outlined, color: theme.primaryColor),
            ),
          ),
          const SizedBox(
            width: Dimensions.FREE_SIZE_DEFAULT,
          ),
          Text(
            title.tr,
            style: bodyMediumText(context)!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Get.isDarkMode
                  ? AppColor.cardColor
                  : AppColor.splashBlueTittleColor,
            ),
          ),
          const Spacer(),
          CustomIconButton(
            iconSize: 18,
            onPressed: () {},
            iconName: Icons.arrow_forward_ios,
            iconColor: theme.primaryColor,
          )
        ],
      ),
    );
  }
}

class TopArea extends StatelessWidget {
  const TopArea({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        // Frosted Glass Circle Container
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // blur level
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.primaryColor.withValues(alpha: 0.25), // glass tint
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.4),
                  width: 2,
                ),
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/9366572/pexels-photo-9366572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
            ),
          ),
        ),
        // Camera Button with iOS Glass Effect
        Positioned(
          bottom: 0,
          right: 0,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.cardColor.withValues(alpha: 0.25),
                  border: Border.all(
                    color: Get.isDarkMode
                        ? AppColor.cardColor.withValues(alpha: 0.4)
                        : theme.cardColor.withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 3),
                      color: Colors.black12,
                    )
                  ],
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 18,
                  color: Get.isDarkMode ? AppColor.cardColor : theme.cardColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
