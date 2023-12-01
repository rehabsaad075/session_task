import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:eraasoft_first_project/ToDoApp/models/statistics_model.dart';
import 'package:eraasoft_first_project/ToDoApp/models/todo_fire_model.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/firebase/firebaseKeys.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/loacl/shared_keys.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/loacl/shared_preferences.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/network/diohelper.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/network/endPoints.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      if(tasksModel?.data?.meta?.currentPage==tasksModel?.data?.meta?.lastPage)
      {
        hasMoreTasks=false;
      }
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
      removeTask();
      getAllTasks();
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

  StatisticsModel? statisticsModel;
  int total=0;
  Future<void>showStatistics()async {
    emit(ShowStatisticsLoadingState());
    await DioHelper.get(
        endPoint: "${EndPoints.tasks}-${EndPoints.statistics}",
        token: LocalData.get(key: SharedKeys.token),
    ).then((value) {
      print(value.data);
      statisticsModel=StatisticsModel.fromJson(value.data);
      total= (statisticsModel?.data?.newTask??0)+(statisticsModel?.data?.outdated??0)+(statisticsModel?.data?.doing??0)+(statisticsModel?.data?.completed??0);
      emit(ShowStatisticsSuccessState());
    }).catchError((error){
      if(error is DioException){
        print(error.response?.data);
      }
      emit(ShowStatisticsErrorState());
    });
  }

  ScrollController scrollController=ScrollController();
  void initController(){
    scrollController=ScrollController();
  }
  void disposeController(){
    scrollController.dispose();
  }
  void scrollerListener(){
    scrollController.addListener(() {
      if(scrollController.position.atEdge ){
        if(scrollController.position !=0 && !isLoadingTasks && hasMoreTasks){
          print('you are Bottom');
          getMoreTasks();
        }
      }
    });
  }
  bool hasMoreTasks=true;
  bool isLoadingTasks=false;

  Future<void>getMoreTasks()async {
    isLoadingTasks=true;
    emit(GetMoreTasksLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.tasks,
      token: LocalData.get(key:SharedKeys.token,),
      parameters: {
        'page': (tasksModel?.data?.meta?.currentPage??0)+1
      }
    ).then((value) {
     isLoadingTasks=false;
      TasksModel newTasksModel =TasksModel.fromJson(value.data);
      tasksModel?.data?.meta=newTasksModel.data?.meta;
      tasksModel?.data?.tasks?.addAll(newTasksModel.data?.tasks??[]);
      if(tasksModel?.data?.meta?.currentPage==tasksModel?.data?.meta?.lastPage)
      {
        hasMoreTasks=false;
      }
      emit(GetMoreTasksSuccessState());
    }).catchError((error){
      print(error);
      isLoadingTasks=false;
      if(error is DioException){
        print(error.response?.data);
      }
      emit(GetMoreTasksErrorState());
    });
  }

  Future<void>addTaskWithFireStore()async {
    emit(StoreNewTaskLoadingState());
    TodoFireModel todoFire=TodoFireModel(
      title:titleController.text,
      endDate:lastDateController.text,
      startDate:startDateController.text,
      description:descriptionController.text,
      userId:LocalData.get(key: SharedKeys.uid),
      status:'new',
    );
    String ?link;
    if (image !=null) {
      await uploadImage(image: image!, onSuccess: (photoLink) {
        link = photoLink;
      });
    }
    todoFire.image=link;
    await FirebaseFirestore.instance.collection(FirebaseKeys.tasks).
    add({
      "title":titleController.text,
      "description":descriptionController.text,
      "start_date":startDateController.text,
      "end_date":lastDateController.text,
      // if(image != null)
      //   "image":await MultipartFile.fromFile(image!.path),
      "status":"new",
      "userId":LocalData.get(key: SharedKeys.uid)
    }).then((value) {
      emit(StoreNewTaskSuccessState());
    }).catchError((error){
      emit(ShowStatisticsErrorState());
      throw error;
    });
  }

  List<TodoFireModel>tasksFireList=[];
  Future<void>getAllTasksFromFireStore()async{
    emit(GetAllTasksLoadingState());
    await FirebaseFirestore.instance.collection(FirebaseKeys.tasks)
        .where('userId',isEqualTo: LocalData.get(key: SharedKeys.uid))
        .get()
        .then((value) {
          tasksFireList=[];
          for(var i in value.docs){
            tasksFireList.add(TodoFireModel.fromFireStore(i.data(),id: i.reference));
          }
          emit(GetAllTasksSuccessState());
    }).catchError((error){
      emit(GetAllTasksErrorState());
    });
  }


TodoFireModel ?currentTask;
  Future<void>getTaskFromFireStore()async{
    emit(GetTasksFromFireStoreLoadingState());
    await tasksFireList[currentIndex].id?.get()
    .then((value){
      currentTask=TodoFireModel.fromFireStore(value.data()as Map<String,dynamic>, id:value.reference ) ;
      emit(GetTasksFromFireStoreSuccessState());
    }).catchError((error){
      emit(GetTasksFromFireStoreErrorState());
      throw error;
    });
  }

  void setDateFromFirebaseToControllers(int index){
    currentIndex=index;
    titleController.text=tasksFireList[currentIndex].title??'';
    descriptionController.text=tasksFireList[currentIndex].description??'';
    startDateController.text=tasksFireList[currentIndex].startDate??'';
    lastDateController.text=tasksFireList[currentIndex].endDate??'';
  }

  void setDateFromControllersToFirebase(){
  currentTask?.title= titleController.text;
  currentTask?.description= descriptionController.text;
  currentTask?.startDate=startDateController.text;
  currentTask?.endDate=lastDateController.text;
  }


  Future<void>updateTaskWithFirebase()async{
    emit(UpdateTaskLoadingState());
    setDateFromControllersToFirebase();
   await currentTask?.id?.update(currentTask?.toFireStore()??{})
    .then((value) {
      emit(UpdateTaskSuccessState());
      getAllTasksFromFireStore();
   }).catchError((error){
     emit(UpdateTaskErrorState());
     throw error;
   });
  }

  Future<void>deleteTaskWithFirebase()async{
    emit(DeleteTaskLoadingState());
    setDateFromControllersToFirebase();
    await currentTask?.id?.delete()
    .then((value) {
      emit(DeleteTaskSuccessState());
      getAllTasksFromFireStore();
    }).catchError((error){
      emit(DeleteTaskErrorState());
      throw error;
    });
  }

  Future<void>uploadImage({required XFile image,required Function(String value)onSuccess})async{
    emit(UploadImageLoadingState());
  await FirebaseStorage.instance.ref().child('tasks/${image.name}').putFile(File(image.path))
      .then((photo) async {
      await photo.ref.getDownloadURL().then((value) {
         onSuccess(value);
         emit(UploadImageSuccessState());
       });
    });
  }
}