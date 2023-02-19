import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_bloc.dart';
import 'package:tix_tales/services/auth/bloc/auth_event.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/src/Constants/routes.dart';
import 'package:tix_tales/views/home_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  //Tab controller => ensure the selected tab and content sections are
  //in sync

  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
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
          const Center(child: HomePage()),
          const Center(child: Text("This is school view")),
          const Center(child: Text("This is business view")),
          const Center(child: Text("This is school view")),
        ],
      ),
      bottomNavigationBar: Material(
        color: AppResources.appColors.globalGrey,
        child: TabBar(
          padding: const EdgeInsets.all(10.0),
          controller: _tabController,
          tabs: [
            Tab(
                icon: Image.asset(
              AppAssets.homeIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            )),
            Tab(
                icon: Image.asset(
              AppAssets.searchIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            )),
            Tab(
                icon: Image.asset(
              AppAssets.ticketIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            )),
            Tab(
                icon: Image.asset(
              AppAssets.heartIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            )),
            Tab(
                icon: Image.asset(
              AppAssets.userIcon,
              color: AppResources.appColors.iconGrey,
              width: 24.0,
              height: 26.3,
            )),
          ],
        ),
      ),
    );
  }
}
