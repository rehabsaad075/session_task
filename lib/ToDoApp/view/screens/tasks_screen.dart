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
      value: TodoCubit.get(context)..getAllTasksFromFireStore()..initController()..scrollerListener(),
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
            return Column(
              children: [
                Expanded(
                  child: Visibility(
                    visible: cubit.tasksFireList.isNotEmpty,
                    //visible: cubit.tasksModel?.data?.tasks?.isNotEmpty??true,
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
                      controller: cubit.scrollController,
                      physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            TasksItemBuilder(
                              todoFireModel: cubit.tasksFireList[index],
                             // tasks: cubit.tasksModel?.data?.tasks?[index]??Tasks(),
                              onTap: () {
                                // with api
                                //cubit.changeIndex(index);
                                // with firebase
                                cubit.setDateFromFirebaseToControllers(index);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        EditTaskScreen(index: index,)
                                    )
                                );
                              },
                            ),
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 15,),
                       // itemCount: cubit.tasksModel?.data?.tasks?.length??0
                       itemCount: cubit.tasksFireList.length,
                    ),
                  ),
                ),
                if(cubit.isLoadingTasks)
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ),
                if(!cubit.hasMoreTasks)
                  const Text(
                      'No more Tasks',
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),

              ],
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
