import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../componets/tasks_item_builder.dart';
import '../cubits/toDo_cubit.dart';
import '../cubits/toDo_states.dart';
import 'addNewTask_screen.dart';
import 'edit_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<TodoCubit,TodoState>(
        listener: (context,state){},
    builder: (context,state){
    TodoCubit cubit=TodoCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: Colors.amber
          ),
        ),
      ),
      body: Visibility(
        visible: cubit.tasks.isNotEmpty,
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
            itemBuilder: (context,index)=>
                TasksItemBuilder(
                  toDoModel:cubit.tasks[index],
                  onTap: (){
                      cubit.changeIndex(index);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>
                         EditTaskScreen(index: index,)
                        )
                    );
                  },
                ),
            separatorBuilder:(context,index)=> const SizedBox(height:15 ,),
            itemCount: cubit.tasks.length
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>
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
    );
        });

  }
}
