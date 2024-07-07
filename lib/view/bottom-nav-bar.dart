import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/config/app-theme.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'collection-screen.dart';
import 'notes/note-screen.dart';

class BottomNavBar extends StatelessWidget {
  // MainApp({required Key key}) : super(key: key);
  BottomNavBar({Key? key}) : super(key: key);
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style10, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [NotesScreen(), CollectionScreen()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  final Color primeCol = AppTheme.primaryColor;
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.doc_fill),
      title: ("Notes"),
      activeColorPrimary: primeCol,
      activeColorSecondary: Colors.white,
      inactiveColorPrimary: primeCol,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.collections_solid),
      title: ("Collection"),
      activeColorPrimary: primeCol,
      activeColorSecondary: Colors.white,
      inactiveColorPrimary: primeCol,
    ),
  ];
}
