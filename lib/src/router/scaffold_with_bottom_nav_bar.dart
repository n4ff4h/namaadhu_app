import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:namaadhu_app/src/constants/app_colors.dart';

import 'app_router.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithBottomNavBar({super.key, required this.child});

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  // used for the currentIndex argument of BottomNavigationBar
  int _selectedIndex = 0;

  void _tap(BuildContext context, int index) {
    if (index == _selectedIndex) {
      // If the tab hasn't changed, do nothing
      return;
    }
    setState(() => _selectedIndex = index);
    if (index == 0) {
      // Note: this won't remember the previous state of the route
      // More info here:
      // https://github.com/flutter/flutter/issues/99124
      context.goNamed(AppRoute.home.name);
    } else if (index == 1) {
      context.goNamed(AppRoute.settings.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    // System nav bar color
    final systemTheme = SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: kBottomNavBarColor);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemTheme,
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kBottomNavBarColor,
          selectedItemColor: kPrimaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.settings),
              label: 'Settings',
            ),
          ],
          onTap: (index) => _tap(context, index),
        ),
      ),
    );
  }
}
