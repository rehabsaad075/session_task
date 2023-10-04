import 'package:flutter/material.dart';

import '../componets/tasks_item_builder.dart';
import '../models/toDo_model.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);
  final List<ToDoModel>archive=const[
    ToDoModel(
      title: 'Go to club',
      date: '30-10-2023',
      time: '1:30 pm',
    ),
    ToDoModel(
      title: 'create new project',
      date: '6-10-2023',
      time: '4:30 pm',
    ),
    ToDoModel(
      title: 'Go to shopping',
      date: '24-10-2023',
      time: '7:00 pm',
    ),
    ToDoModel(
      title: 'go to restaurant',
      date: '10-10-2023',
      time: '9:30 pm',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index)=>
            TasksItemBuilder(toDoModel: archive[index],),
        separatorBuilder:(context,index)=> const SizedBox(height:15 ,),
        itemCount: archive.length
    );
  }
}

