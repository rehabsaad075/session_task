import 'package:flutter/material.dart';

import '../models/toDo_model.dart';
import '../screens/edit_task_screen.dart';

class TasksItemBuilder extends StatelessWidget {
  final ToDoModel toDoModel;
  final void Function() onTap;
  const TasksItemBuilder({Key? key, required this.toDoModel, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:  BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
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
              toDoModel.title??'',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 18
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              toDoModel.description??'',
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 18
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              toDoModel.startDate??'',
              style: const TextStyle(
                  color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              toDoModel.lastDate??'',
              style: const TextStyle(
                  color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
