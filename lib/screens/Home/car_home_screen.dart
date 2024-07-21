import 'package:flutter/material.dart';
import 'package:final_mobile/constants.dart';
import 'package:final_mobile/screens/Home/bookings_tab.dart';
import 'package:final_mobile/screens/Home/car_list_tab.dart';
import 'package:final_mobile/screens/Home/message_tab.dart';
import 'package:final_mobile/screens/Home/settings_tab.dart';

class CarHomeScreen extends StatefulWidget {
  const CarHomeScreen({Key? key}) : super(key: key);

  @override
  _CarHomeScreenState createState() => _CarHomeScreenState();
}

class _CarHomeScreenState extends State<CarHomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  final List<Widget> _screens = [
    const CarListTab(),
    const CategoryTab(),
    const MessageTab(),
    const SettingsTab(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Car Rental App'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF448AFF),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: const Color.fromARGB(255, 50, 47, 47),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
