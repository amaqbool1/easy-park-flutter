import 'package:easy_park/src/feature/dashboard/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../booking/booking.dart';
import '../../profile/profile.dart';

class HomeView extends StatefulWidget {
  final int pageIndex;

  const HomeView({
    super.key,
    required this.pageIndex,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin<HomeView> {
  int currentPageIndex = 0;

  @override
  void initState() {
    currentPageIndex = widget.pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        surfaceTintColor: Colors.white,
        elevation: 0,
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: SvgPicture.asset("assets/svg/home_selected.svg"),
            icon: SvgPicture.asset("assets/svg/home_unselected.svg"),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset("assets/svg/booking_selected.svg"),
            icon: SvgPicture.asset("assets/svg/booking_unselected.svg"),
            label: 'Booking',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset("assets/svg/profile_selected.svg"),
            icon: SvgPicture.asset("assets/svg/profile_unselected.svg"),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const MapPage(),
        const BookingPage(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
