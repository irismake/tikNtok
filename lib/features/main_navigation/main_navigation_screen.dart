import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tikntok/features/main_navigation/widgets/nav_tab.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class MainNavigationScreen extends StatefulWidget {
  MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Home'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(Sizes.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  text: 'Home',
                  isSelected: _selectedIndex == 0,
                  icon: FontAwesomeIcons.house,
                  onTap: () => _onTap(0),
                ),
                NavTab(
                  text: 'Discover',
                  isSelected: _selectedIndex == 1,
                  icon: FontAwesomeIcons.magnifyingGlass,
                  onTap: () => _onTap(1),
                ),
                NavTab(
                  text: 'Inbox',
                  isSelected: _selectedIndex == 3,
                  icon: FontAwesomeIcons.message,
                  onTap: () => _onTap(3),
                ),
                NavTab(
                  text: 'Profile',
                  isSelected: _selectedIndex == 4,
                  icon: FontAwesomeIcons.user,
                  onTap: () => _onTap(4),
                )
              ],
            ),
          )),
    );
  }
}