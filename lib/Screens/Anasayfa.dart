import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/Screens/Sayfa1Screen.dart';
import 'package:untitled/Screens/Sayfa2Screen.dart';
import 'package:untitled/Screens/Sayfa3Screen.dart';
import 'package:untitled/main.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: mainColor,
      appBar: AppBar(
        elevation:0,
        centerTitle: true,
        toolbarHeight: 150,
        title: Image.asset("lib/assets/morfincan.png"),
      ),
      bottomNavigationBar: _bottomNav(),
      body: _pageOptions[_selectedIndex],
    );
  }

  _bottomNav() {
    return BottomNavigationBar(
      showSelectedLabels: false,   // <-- HERE
      showUnselectedLabels: false, // <-- AND HERE

      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(Icons.home,size: 50,),
          label:"Item 0",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger,size: 45,),
          label: "Item 1",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,size: 45,),
          label: "Item 1",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,size: 45,),
          label: "Item 1",
        ),
      ],
      currentIndex: _selectedIndex,
backgroundColor: mainColor,
      unselectedItemColor: secondColor,
      selectedItemColor: secondColor,
      onTap: _onItemTapped,

    );
  }

  final _pageOptions = [
    Sayfa1Screen(),
    Sayfa2Screen(),
    Sayfa3Screen(),
    Sayfa1Screen(),
  ];

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }
}
