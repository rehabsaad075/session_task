import 'package:eraasoft_first_project/ToDoApp/models/todo_fire_model.dart';
import 'package:flutter/material.dart';

import '../../models/todo_model.dart';
import '../screens/edit_task_screen.dart';

class TasksItemBuilder extends StatelessWidget {
  //with api
 // final Tasks tasks;
  //with firebase
  final TodoFireModel todoFireModel;
  final void Function() onTap;
  const TasksItemBuilder({Key? key, required this.onTap,
    //required this.tasks,
    required this.todoFireModel, }) : super(key: key);
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
              todoFireModel.title??'',
             //tasks.title??'',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 18
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              //tasks.description??'',
              todoFireModel.description??'',
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 18
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              todoFireModel.startDate??'',
             // tasks.startDate??'',
              style: const TextStyle(
                  color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              todoFireModel.endDate??'',
              //tasks.endDate??'',
              style: const TextStyle(
                  color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5,),
            // Visibility(
            //   visible: (tasks.image??'').isNotEmpty,
            //     child: Image.network(tasks.image??'')),

            if((todoFireModel.image??'').isNotEmpty)
            ...[
              Image.network(todoFireModel.image??'')
            ]
          ],
        ),
      ),
    );
  }
}
