import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/home/home_screen.dart';
import 'package:carisma/screen/message/message_screen.dart';
import 'package:carisma/screen/my_list/my_list_screen.dart';
import 'package:carisma/screen/profile/profile_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';


class MainScreen extends StatefulWidget {
  static String routeName = "/main";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  int _selectedIndex = 0;

  static List<Widget> _screenOption = [
    HomeScreen(),
    // MyListScreen(),
    MessageScreen(),
    ProfileScreen()
  ];

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color isActiveColor = Color(0xFFB6B6B6);

    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screenOption,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: _selectedIndex == 0 ? kPrimaryColor : isActiveColor,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              color: _selectedIndex == 1 ? kPrimaryColor : isActiveColor,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              color: _selectedIndex == 2 ? kPrimaryColor : isActiveColor,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: _selectedIndex == 3 ? kPrimaryColor : isActiveColor,
            ),
            label: '',
            backgroundColor: Colors.white,
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
      ),
    );
  }
}
