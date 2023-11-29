import 'dart:io';

import 'package:eraasoft_first_project/ToDoApp/view_model/cubits/todo_cubit/todo_cubit.dart';

import 'package:eraasoft_first_project/ToDoApp/view/componets/textFormField_custom.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/cubits/todo_cubit/todo_states.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componets/elevated_button_custom.dart';


class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TodoCubit cubit=TodoCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: const Text(
              'Add New Task',
              style: TextStyle(
                color: Colors.amber
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.amber
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children:[
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          TextFormFieldCustom(
                            keyboardType: TextInputType.text,
                            labelText: 'Title',
                            controller: cubit.titleController,
                            icon: Icons.home,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldCustom(
                            keyboardType: TextInputType.text,
                            labelText: 'Description',
                            icon: Icons.edit,
                            controller: cubit.descriptionController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldCustom(
                            keyboardType: TextInputType.none,
                            labelText: 'startDate',
                            icon: Icons.date_range,
                            onTap: () async {
                              DateTime? datePicker=await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 365*5)),
                              );
                              if (datePicker != null){
                                cubit.startDateController.text=
                                "${datePicker.year}-${datePicker.month}-${datePicker.day}";
                              }
                            },
                            controller: cubit.startDateController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldCustom(
                            keyboardType: TextInputType.none,
                            labelText: 'lastDate',
                            icon: Icons.date_range_rounded,
                            onTap: () async {
                              DateTime? lastDatePicker=await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 365*5)),
                              );
                              if (lastDatePicker != null){
                                cubit.lastDateController.text=
                                "${lastDatePicker.year}-${lastDatePicker.month}-${lastDatePicker.day}";
                              }
                            },
                            controller: cubit.lastDateController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<TodoCubit, TodoState>(
                            builder: (context, state) {
                             return InkWell(
                            onTap: (){
                              cubit.takePhotoFromUser();
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey
                                )
                              ),
                              child: Visibility(
                                visible: cubit.image==null,
                                replacement: Image.file(File(cubit.image?.path??'')),
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 200,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                        'add a photo',
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 30
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                          },
                        )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButtonCustom(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()){
                        cubit.addTaskWithFireStore().then((value) => {
                          showToast(msg: 'Added successfully'),
                        //cubit.removeTask(),
                          Navigator.pop(context)
                        });
                      }
                    },
                    text: 'Add New Task',
                  ),
                ]
              ),
            ),
          ) ,

        );

  }
}
