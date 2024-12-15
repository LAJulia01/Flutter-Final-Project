// custom_bottom_navigation_bar.dart

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nannycare/views/booking/Request_BookingPage.dart';
import 'package:nannycare/views/favorite/favoritespage.dart';
import 'package:nannycare/views/home/mainpage.dart';
import 'package:nannycare/views/menu/menupage.dart';
import 'package:nannycare/views/notifications/notificationpage.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const BookingRequestPage(
          documentId: '',
        );
        break;
      case 1:
        page = const FavoritesPage();
        break;
      case 2:
        page = const MainPage();
        break;
      case 3:
        page = const NotificationsPage();
        break;
      case 4:
        page = const MenuPage();
        break;
      default:
        page = const MainPage();
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: selectedIndex, // Current selected index
      height: 60, // Adjust height if needed
      backgroundColor: Colors.white, // Match with page background
      color: const Color(0xFFF5A7A5), // Bar background color
      buttonBackgroundColor:
          const Color(0xFFF5A7A5), // Highlighted button color
      animationDuration: const Duration(milliseconds: 800),
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        Icon(Icons.calendar_month_rounded, size: 24, color: Colors.white),
        Icon(Icons.star_rounded, size: 24, color: Colors.white),
        Icon(Icons.home_rounded, size: 24, color: Colors.white),
        Icon(Icons.notifications_rounded, size: 24, color: Colors.white),
        Icon(Icons.person_rounded, size: 24, color: Colors.white),
      ],
    );
  }
}
