// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:glamii_app/view/screens/calendar/calendar_screen.dart';
import 'package:glamii_app/view/screens/category/categories_screen.dart';
import 'package:glamii_app/view/screens/feature_service/featured_services_screen.dart';
import 'package:glamii_app/view/screens/profile/profile_screen.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;
  DateTime? lastPressed;

  final List<Widget> _pages = [
    FeaturedServicesScreen(),
    CategoriesScreen(),
    const CalendarScreen(),
    const ProfileScreen(),
  ];

  // Add a boolean to track the state of the drawer
  bool _isDrawerOpen = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    if (index == 4) {
      // Open drawer when the "More" button is clicked
      scaffoldKey.currentState?.openDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
        _isDrawerOpen = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
            lastPressed == null ||
                now.difference(lastPressed!) > const Duration(seconds: 2);

        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        }

        if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
          lastPressed = DateTime.now();
          return false;
        }

        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        onDrawerChanged: (isOpen) {
          setState(() {
            _isDrawerOpen = isOpen;
          });
        },
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).cardColor,
            elevation: 5,
            unselectedItemColor: Theme.of(context).disabledColor,
            selectedItemColor: Theme.of(context).primaryColor,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: bodyMediumText(context)!.copyWith(
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: Theme.of(context).primaryColor,
            ),
            unselectedLabelStyle: bodyMediumText(context)!.copyWith(
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: Theme.of(context).disabledColor,
            ),
            items: [
              _buildNavItem(iconData: Icons.home, label: 'Home', index: 0),
              _buildNavItem(
                  iconData: Icons.favorite, label: 'Favorite', index: 1),
              _buildNavItem(
                  iconData: Icons.calendar_month, label: 'Calendar', index: 2),
              _buildNavItem(iconData: Icons.person, label: 'Profile', index: 3),
            ],
            currentIndex: _isDrawerOpen
                ? 4
                : _selectedIndex, // Drawer open shows "More" as selected
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    String? iconPath,
    IconData? iconData,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: (_isDrawerOpen && index == 4) || _selectedIndex == index
          ? (iconPath != null
              ? SvgPicture.asset(
                  iconPath,
                  color: Theme.of(context).primaryColor,
                  width: 22,
                )
              : Icon(
                  iconData,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ))
          : (iconPath != null
              ? SvgPicture.asset(
                  iconPath,
                  color: Theme.of(context).disabledColor,
                  width: 22,
                )
              : Icon(
                  iconData,
                  color: Theme.of(context).disabledColor,
                  size: 22,
                )),
      label: label,
    );
  }
}
