import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/greeting_controller.dart';
import '../../../../controller/theme_controller.dart';
import '../../../../theme/light_theme.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../base/custom_icon_button.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    // define greetingController
    final GreetingController greetingController = Get.put(GreetingController());

    // define the theme for the app
    final theme = Theme.of(context);

    // Appbar
    return AppBar(
      backgroundColor: theme.cardColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  // profile image section
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(RouteHelper.getProfileRoute());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipOval(
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.3),
                                border: Border.all(
                                  color: theme.cardColor,
                                  width: 2.0,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                "https://wallpapers.com/images/hd/cool-profile-picture-paper-bag-head-4co57dtwk64fb7lv.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // green online dot
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: const Color(0xff71DD37),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.cardColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(width: Dimensions.FREE_SIZE_DEFAULT),

              // greeting and name section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${greetingController.greeting.value} ${greetingController.emoji.value}",
                    style: bodySmallText(context)!.copyWith(
                      color: theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(RouteHelper.getProfileRoute());
                    },
                    child: Text(
                      "Emma Oliver!",
                      textAlign: TextAlign.center,
                      style: giazaStencilMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        color: theme.textTheme.bodyLarge!.color,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        // dark mode button
        CustomIconButton(
          onPressed: () {
            Get.find<ThemeController>().toggleTheme();
          },
          isImage: false,
          iconName: Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          iconSize: 24,
          iconColor: Get.isDarkMode ? theme.indicatorColor : AppColor.primary,
        ),

        // notification button
        CustomIconButton(
          onPressed: () {},
          isImage: false,
          iconName: Icons.notifications,
          iconColor: Get.isDarkMode ? theme.indicatorColor : AppColor.primary,
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size(1170, GetPlatform.isDesktop ? 70 : 50);
}
