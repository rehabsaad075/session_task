import 'package:flutter/material.dart';

import 'bookmark_screen.dart';
import 'buisness_screen.dart';
import 'home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
 const  BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
   List<Widget>screens=[
     const HomeScreen(),
     const BusinessScreen(),
     const BookMarkScreen(),
   ];

int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
       bottomNavigationBar:BottomNavigationBar(
        onTap: (int value){
          setState(() {
            index=value;
          });
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'
          ),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'business'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'bookmark'
            ),
        ],
      ),
    );
  }
}
