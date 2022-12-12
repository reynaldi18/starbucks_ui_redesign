import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Favorites',
      style: optionStyle,
    ),
    Text(
      'Index 2: Notifications',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(37.0),
          topRight: Radius.circular(37.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: BaseColors.primary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/ic_home.svg',
                width: 22.0,
                height: 22.0,
                color: BaseColors.primaryAccent,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/ic_home_active.svg',
                width: 22.0,
                height: 22.0,
                color: Colors.white,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: BaseColors.primaryAccent,
                size: 22.0,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: BaseColors.white,
                size: 22.0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/ic_bell.svg',
                width: 22.0,
                height: 22.0,
                color: BaseColors.primaryAccent,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/ic_bell_active.svg',
                width: 22.0,
                height: 22.0,
                color: Colors.white,
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
