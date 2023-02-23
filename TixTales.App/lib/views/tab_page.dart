import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_event.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/src/Constants/routes.dart';
import 'package:tix_tales/views/home_page.dart';
import 'package:tix_tales/views/single_event_view.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    CheckPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppAssets.homeIcon,
              color: AppResources.appColors.globalDark,
              width: 24.0,
              height: 26.3,
            ),
            icon: Image.asset(
              AppAssets.homeIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            ),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppAssets.searchIcon,
              color: AppResources.appColors.globalDark,
              width: 24.0,
              height: 26.3,
            ),
            icon: Image.asset(
              AppAssets.searchIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            ),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppAssets.ticketIcon,
              color: AppResources.appColors.globalDark,
              width: 24.0,
              height: 26.3,
            ),
            icon: Image.asset(
              AppAssets.ticketIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            ),
            label: 'Screen 3',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppAssets.heartIcon,
              color: AppResources.appColors.globalDark,
              width: 24.0,
              height: 26.3,
            ),
            icon: Image.asset(
              AppAssets.heartIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            ),
            label: 'Screen 3',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              AppAssets.userIcon,
              color: AppResources.appColors.globalDark,
              width: 24.0,
              height: 26.3,
            ),
            icon: Image.asset(
              AppAssets.userIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            ),
            label: 'Screen 3',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CheckPage extends StatelessWidget {
  const CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  const AuthEventLogout(),
                );
            Navigator.pushNamedAndRemoveUntil(
                context, onboardingRoute, (route) => false);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
