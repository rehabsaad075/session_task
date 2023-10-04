import 'package:flutter/material.dart';

import 'archive_screen.dart';
import 'done_screen.dart';
import 'tasks_screen.dart';

class ToDoHomeScreen extends StatelessWidget {
  const ToDoHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            'ToDoApp',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        body: const Column(
          children: [
            TabBar(
                tabs: [
                  Tab(
                    text: 'Tasks',
                  ),
                  Tab(
                    text: 'Done',
                  ),
                  Tab(
                    text: 'Archive',
                  ),
                ]
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TabBarView(
                    children: [
                      TasksScreen(),
                      DoneScreen(),
                      ArchiveScreen()
                      ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
