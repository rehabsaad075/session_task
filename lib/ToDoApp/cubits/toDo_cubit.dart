import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/toDo_model.dart';
import 'toDo_states.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitialState());


  static TodoCubit get(context) => BlocProvider.of(context);


  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var startDateController = TextEditingController();
  var lastDateController = TextEditingController();

  var formKey=GlobalKey<FormState>();

  List<ToDoModel>tasks=[];
  Future<void> addTask()async {
    ToDoModel toDoModel=ToDoModel(
        title: titleController.text,
        description: descriptionController.text,
        startDate: startDateController.text,
        lastDate: lastDateController.text
    );
    tasks.add(toDoModel);
    removeTask();
    emit(AddTaskState());
  }

  void removeTask(){
    titleController.text='';
    descriptionController.text='';
    startDateController.text='';
    lastDateController.text='';
    emit(RemoveTaskState());
  }

  int currentIndex=0;
  void changeIndex(int index){
    currentIndex=index;
    titleController.text=tasks[index].title??'';
    descriptionController.text=tasks[index].description??'';
    startDateController.text=tasks[index].startDate??'';
    lastDateController.text=tasks[index].lastDate??'';
  }

  Future<void> editTask({required int index})async {
    currentIndex=index;
    tasks[index].title=titleController.text;
    tasks[index].description=descriptionController.text;
    tasks[index].startDate=startDateController.text;
    tasks[index].lastDate=lastDateController.text;
    removeTask();
    emit(EditTaskState());
  }

  Future<void> deleteTask({required int index})async {
    tasks.removeAt(index);
    removeTask();
    emit(DeleteTaskState());
  }
}