import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/views/pages/favorites_page.dart';
import 'package:food_delivery_app/views/pages/home_page.dart';
import 'package:food_delivery_app/views/pages/profile_page.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar>
    with WidgetsBindingObserver {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      debugPrint('App is paused');
    } else if (state == AppLifecycleState.resumed) {
      debugPrint('App is resumed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(
        child: Center(
          child: Text('Inside the drawer!'),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
        title: Column(
          children: [
            Text(
              'Current Location',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.grey,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.green,
                ),
                const SizedBox(width: 4),
                Text(
                  'Giza, Egypt',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: size.width >= 800
          ? null
          : NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedIndex: currentPageIndex,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.favorite),
                  icon: Icon(Icons.favorite_border),
                  label: 'Favorites',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            ),
      body: const <Widget>[
        HomePage(),
        FavoritesPage(),
        ProfilePage(),
      ][currentPageIndex],
    );
  }
}
