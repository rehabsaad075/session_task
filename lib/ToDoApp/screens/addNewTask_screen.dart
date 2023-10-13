import 'package:eraasoft_first_project/ToDoApp/cubits/toDo_cubit.dart';
import 'package:eraasoft_first_project/ToDoApp/cubits/toDo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componets/elevated_button_custom.dart';
import '../componets/textFormField_custom.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical:15),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children:[
                  Expanded(
                    child: SingleChildScrollView(
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
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButtonCustom(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()){
                        cubit.addTask().then((value) => {
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
