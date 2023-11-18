import 'package:eraasoft_first_project/ToDoApp/view/componets/elevated_button_custom.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/cubits/todo_cubit/todo_cubit.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/cubits/todo_cubit/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'tasks_screen.dart';

class ShowStatisticsScreen extends StatelessWidget {
  const ShowStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: TodoCubit.get(context)..showStatistics() ,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<TodoCubit, TodoState>(
         builder: (context, state) {
           TodoCubit cubit = TodoCubit.get(context);
         return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:TodoCubit.get(context).statisticsModel!=null? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dashboard Tasks',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(50),
                  child: CircularPercentIndicator(
                      radius: 140.0,
                      lineWidth: 10.0,
                      backgroundColor: Colors.grey[800]!,
                      progressColor: Colors.amber,
                      percent: (cubit.statisticsModel?.data?.newTask??0.1).toDouble()/cubit.total.toDouble(),
                      animation: true,
                      center: CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 10.0,
                        backgroundColor: Colors.grey[800]!,
                        progressColor: Colors.purple,
                        percent: (cubit.statisticsModel?.data?.completed??0.1).toDouble()/cubit.total.toDouble(),
                        animation: true,
                        center: CircularPercentIndicator(
                          radius: 100.0,
                          lineWidth: 10.0,
                          backgroundColor: Colors.grey[800]!,
                          progressColor: Colors.teal,
                          percent: (cubit.statisticsModel?.data?.doing??0.1).toDouble()/cubit.total.toDouble(),
                          animation: true,
                          center: CircularPercentIndicator(
                            radius: 80.0,
                            lineWidth: 10.0,
                            backgroundColor: Colors.grey[800]!,
                            progressColor: Colors.red,
                            percent: (cubit.statisticsModel?.data?.outdated??0.1).toDouble()/cubit.total.toDouble(),
                            animation: true,
                            center:  Text(
                              "${cubit.total.toString()??''} Tasks",
                              style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Text(
                      'New Tasks',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Text(
                      'Completed Tasks',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Text(
                      'doing Tasks',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Text(
                      'Outdated Tasks',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                ElevatedButtonCustom(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const TasksScreen()
                        )
                    );
                  },
                  text: 'Go To Tasks',
                  width: double.infinity,
                )
              ],
            ):
            const Center(child: CircularProgressIndicator()),
          ),
        );
  },
),
      ),
    );
  }
}
