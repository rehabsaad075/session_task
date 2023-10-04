import 'package:flutter/material.dart';

import '../bottom_navigation_bar/bookmark_screen.dart';
import '../bottom_navigation_bar/buisness_screen.dart';
import '../bottom_navigation_bar/home_screen.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   const DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
          child:Column(
            children: [
              TabBar(
                  labelColor:Colors.pink,
                 indicatorColor: Colors.pink,
                  tabs: [
                    Tab(
                      icon:Icon(Icons.home),
                      text: 'home',
                    ),
                    Tab(
                      icon:Icon(Icons.business_center),
                      text: 'business',
                    ),
                    Tab(
                      icon:Icon(Icons.bookmark),
                      text: 'bookmark',
                    ),
                  ]
              ),
              Expanded(
                child: TabBarView(
                    children: [
                      HomeScreen(),
                      BusinessScreen(),
                      BookMarkScreen()
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
