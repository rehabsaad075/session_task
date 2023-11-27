import 'dart:io';

import 'package:eraasoft_first_project/ToDoApp/view/componets/textFormField_custom.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/cubits/todo_cubit/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/utils/functions.dart';
import '../componets/elevated_button_custom.dart';

import '../../view_model/cubits/todo_cubit/todo_cubit.dart';

class EditTaskScreen extends StatelessWidget {
  final int index;
  const EditTaskScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoCubit cubit=TodoCubit.get(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Edit the Task',
          style: TextStyle(
              color: Colors.amber
          ),
        ),
        iconTheme: const IconThemeData(
            color: Colors.amber
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:15),
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
                          height: 15,
                        ),
                        TextFormFieldCustom(
                          keyboardType: TextInputType.text,
                          labelText: 'Description',
                          icon: Icons.edit,
                          controller: cubit.descriptionController,
                        ),
                        const SizedBox(
                          height: 15,
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
                          height: 15,
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
                            TodoCubit cubit =TodoCubit.get(context);
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
                                  child:  Column(
                                    children: [
                                      if((cubit.tasksModel?.data?.tasks?[cubit.currentIndex].image??'').isNotEmpty)
                                      Image.network(cubit.tasksModel?.data?.tasks?[cubit.currentIndex].image??''),
                                      if((cubit.tasksModel?.data?.tasks?[cubit.currentIndex].image??'').isEmpty)...[
                                        const Icon(
                                          Icons.image,
                                          size: 200,
                                          color: Colors.amber,
                                        ),
                                        const Text(
                                          'add a photo',
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 30
                                          ),
                                        )
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                         const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButtonCustom(
                        onPressed: () {
                          if(cubit.formKey.currentState!.validate()){
                            cubit.updateTask().then((value) => {
                              showToast(msg: 'updated successfully'),
                              Navigator.pop(context)
                            });
                          }
                        },
                        text: 'Edit the Task',
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButtonCustom(
                        onPressed: () {
                          if(cubit.formKey.currentState!.validate()){
                            cubit.delete().then((value) => {
                              showToast(msg: 'deleted successfully'),
                              Navigator.pop(context)
                            });
                          }
                        },
                        text: 'Delete the Task',
                      ),
                    ),
                  ],
                )

              ]
          ),
        ),
      ) ,

    );
  }
}
