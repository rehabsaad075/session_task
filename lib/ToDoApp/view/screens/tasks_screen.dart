import 'package:eraasoft_first_project/ToDoApp/models/todo_model.dart';
import 'package:eraasoft_first_project/ToDoApp/view/componets/tasks_item_builder.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/cubits/todo_cubit/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubits/todo_cubit/todo_cubit.dart';

import 'addNewTask_screen.dart';
import 'edit_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: TodoCubit.get(context)..getAllTasks(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
              color: Colors.yellow
          ),
          title: const Text(
            'Tasks',
            style: TextStyle(
                color: Colors.amber
            ),
          ),
        ),
        body: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            TodoCubit cubit = TodoCubit.get(context);
            return Visibility(
              visible: cubit.tasksModel?.data?.tasks?.isNotEmpty??true,
              replacement: const Center(
                child: Text(
                  'No Tasks Yet, Please Add Some Tasks',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20
                  ),
                ),
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      TasksItemBuilder(
                        tasks: cubit.tasksModel?.data?.tasks?[index]??Tasks(),
                        onTap: () {
                          cubit.changeIndex(index);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  EditTaskScreen(index: index,)
                              )
                          );
                        },
                      ),
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 15,),
                  itemCount: cubit.tasksModel?.data?.tasks?.length??0
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            TodoCubit.get(context).removeTask();
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>
                    const AddNewTaskScreen())
            );
          },
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }
}
