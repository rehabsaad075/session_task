import 'package:dio/dio.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/loacl/shared_keys.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/loacl/shared_preferences.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/network/diohelper.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/network/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../models/todo_model.dart';
import 'todo_states.dart';


class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitialState());


  static TodoCubit get(context) => BlocProvider.of(context);


  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var startDateController = TextEditingController();
  var lastDateController = TextEditingController();

  var formKey=GlobalKey<FormState>();

  List<TodoModel>tasks=[];
  Future<void> addTask()async {
    TodoModel toDoModel=TodoModel(
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
    image=null;
    emit(RemoveTaskState());
  }

  int currentIndex=0;
  void changeIndex(int index){
    removeTask();
    currentIndex=index;
    titleController.text=tasksModel?.data?.tasks?[index].title??'';
    descriptionController.text=tasksModel?.data?.tasks?[index].description??'';
    startDateController.text=tasksModel?.data?.tasks?[index].startDate??'';
    lastDateController.text=tasksModel?.data?.tasks?[index].endDate??'';
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

  TasksModel? tasksModel;
  Future<void>getAllTasks()async {
    emit(GetAllTasksLoadingState());
    await DioHelper.get(
        endPoint: EndPoints.tasks,
        token: LocalData.get(key:SharedKeys.token,),
    ).then((value) {
      print(value.data);
      tasksModel =TasksModel.fromJson(value.data);
      emit(GetAllTasksSuccessState());
    }).catchError((error){
      if(error is DioException){
        print(error.response?.data);
      }
      emit(GetAllTasksErrorState());
    });
  }


  Future<void>storeNewTask()async {
    emit(StoreNewTaskLoadingState());
    await DioHelper.post(
      endPoint: EndPoints.tasks,
      token: LocalData.get(key:SharedKeys.token,),
      formData: FormData.fromMap(
          {
            "title":titleController.text,
            "description":descriptionController.text,
            "start_date":startDateController.text,
            "end_date":lastDateController.text,
            if(image != null)
            "image":await MultipartFile.fromFile(image!.path),
            "status":"new"
          }
      )
    ).then((value) {
      print(value.data);
      emit(StoreNewTaskSuccessState());
      getAllTasks();
      removeTask();
      //image=null;
    }).catchError((error){
      if(error is DioException){
        print(error.response?.data);
      }
      emit(StoreNewTaskErrorState());
      throw error;
    });
  }

  XFile? image;
  Future<void> takePhotoFromUser() async {
    emit(UploadImageLoadingState());
    Permission.storage.request();
   image =await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null){
      emit(UploadImageErrorState());
    }
   emit(UploadImageSuccessState());
  }
  
  Future<void>updateTask()async {
    emit(UpdateTaskLoadingState());
    await DioHelper.post(
        endPoint: '${EndPoints.tasks}/${tasksModel?.data?.tasks?[currentIndex].id}',
      token: LocalData.get(key: SharedKeys.token),
        formData: FormData.fromMap(
            {
              "_method":"PUT",
              "title":titleController.text,
              "description":descriptionController.text,
              "start_date":startDateController.text,
              "end_date":lastDateController.text,
              if(image != null)
                "image":await MultipartFile.fromFile(image!.path),
              "status":"new"
            }
        )
    ).then((value) {
      print(value.data);
      emit(UpdateTaskSuccessState());
      getAllTasks();
    }).catchError((error){
      if(error is DioException){
        print(error.response?.data);
      }
      emit(UpdateTaskErrorState());
      throw error;
    });
  }
  
  Future<void>delete()async {
    emit(DeleteTaskLoadingState());
    await DioHelper.delete(
      endPoint: '${EndPoints.tasks}/${tasksModel?.data?.tasks?[currentIndex].id}',
      token: LocalData.get(key: SharedKeys.token),
    ).then((value) {
      print(value.data);
      emit(DeleteTaskSuccessState());
      getAllTasks();
    }).catchError((error){
      if(error is DioException){
        print(error.response?.data);
      }
      emit(DeleteTaskErrorState());
      throw error;
    });
  }
}