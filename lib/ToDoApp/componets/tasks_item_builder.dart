import 'package:flutter/material.dart';

import '../models/toDo_model.dart';

class TasksItemBuilder extends StatelessWidget {
  final ToDoModel toDoModel;
  const TasksItemBuilder({Key? key, required this.toDoModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.amber
        )
      ),
      padding: const EdgeInsets.only(top: 8,left: 8),
      height: 100,
      width: 200,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            toDoModel.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            toDoModel.date,
            style: const TextStyle(
                color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            toDoModel.time,
            style: const TextStyle(
                color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
