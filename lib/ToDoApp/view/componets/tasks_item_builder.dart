import 'package:flutter/material.dart';

import '../../models/todo_model.dart';
import '../screens/edit_task_screen.dart';

class TasksItemBuilder extends StatelessWidget {
  final Tasks tasks;
  final void Function() onTap;
  const TasksItemBuilder({Key? key, required this.onTap, required this.tasks, }) : super(key: key);
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
        width: 200,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             tasks.title??'',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 18
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              tasks.description??'',
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 18
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              tasks.startDate??'',
              style: const TextStyle(
                  color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              tasks.endDate??'',
              style: const TextStyle(
                  color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5,),
            Visibility(
              visible: (tasks.image??'').isNotEmpty,
                child: Image.network(tasks.image??'')),

          ],
        ),
      ),
    );
  }
}
