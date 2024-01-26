import 'package:flutter/material.dart';
import 'package:ghaleb_1/sabet/sabet.dart';
import 'package:ghaleb_1/screens/favorites.dart';
import 'package:ghaleb_1/screens/home.dart';
import 'package:ghaleb_1/screens/profile.dart';
import 'package:ghaleb_1/screens/shopping.dart';

import 'barcode.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _currrent = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List bodies = const [
      Home(),
      Favorite(),
      ShoppingPage(),
      ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const Barcode();
              },
            ),
          );
        },
        backgroundColor: Colors.green[800],
        child: const Icon(Icons.qr_code_scanner),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currrent = value;
          });
        },
        backgroundColor: Colors.white,
        currentIndex: _currrent,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: SabetHa.primary,
              ),
              icon: const Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: SabetHa.primary,
              ),
              icon: const Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.shopping_cart,
                color: SabetHa.primary,
              ),
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: SabetHa.primary,
            ),
            icon: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: '',
          )
        ],
      ),
      body: bodies[_currrent],
    );
  }
}
