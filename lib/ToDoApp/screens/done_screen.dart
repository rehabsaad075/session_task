import 'package:flutter/material.dart';

import '../componets/tasks_item_builder.dart';
import '../models/toDo_model.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);
  final List<ToDoModel>done=const[
    ToDoModel(
      title: 'Go to Gym',
      date: '5-10-2023',
      time: '2:30 pm',
    ),
    ToDoModel(
      title: 'create new project',
      date: '6-10-2023',
      time: '4:30 pm',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index)=>
            TasksItemBuilder(toDoModel: done[index],),
        separatorBuilder:(context,index)=> const SizedBox(height:15 ,),
        itemCount: done.length
    );
  }
}
