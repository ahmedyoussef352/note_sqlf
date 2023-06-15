// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Custom/todo_card.dart';
import 'package:todo/Service/Auth_Service.dart';
import 'package:todo/pages/view_data_state.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final Stream
  AuthClass authClass = AuthClass();
  List<Select> selected=[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {
        if (state is AppInsertDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title:
                // ignore: prefer_const_literals_to_create_immutables

                Text(
              'Today\'s Schedule',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            // ignore: prefer_const_literals_to_create_immutables
            actions: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/phone.svg'),
              ),
              SizedBox(
                width: 25,
              ),
            ],
            bottom: PreferredSize(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text(
                    "Monday 21",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(35),
            ),
          ),
          body: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var tasks = AppCubit.get(context).newTasks;
              return todoBuilder(tasks: tasks);
            },
          ),
        );
      },
    );
  }

  // bool check = false;
  Widget todoItem(Map model, context) => InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) {
            return ViewData(
              document: {'title': model['title']},
              des: {'descreption': model['descreption']},
              id: {'id': model['id']},
              categorye: { 'category': model['category'] },
               typee: {'type': model['type']},
            );
          }));
        },
        child: Dismissible(
            key: Key(model['id'].toString()),
            onDismissed: (direction) {
              AppCubit.get(context).deleteData(id: model['id']);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  // Theme(
                  //   // ignore: sort_child_properties_last
                  //   child: Transform.scale(
                  //     scale: 1.5,
                  //     child: Checkbox(
                  //       shape: BeveledRectangleBorder(
                  //           borderRadius: BorderRadius.circular(5)),
                  //       activeColor: Color.fromARGB(255, 2, 119, 254),
                  //       checkColor: Color(0xff0e3e26),
                  //       onChanged: (bool? value) {
                  //         setState(() {
                  //           // check == true ? check = false : check = true;
                  //           selected.add(Select(id: model['id'],checkValue: false));
                  //         });
                  //       },
                  //       value: true,
                  //     ),
                  //   ),
                  //   data: ThemeData(
                  //       primaryColor: Colors.blue,
                  //       unselectedWidgetColor: Color(0xff5e616a)),
                  // ),
                  Expanded(
                      child: Container(
                    height: 75,
                    child: Card(
                      color: Color(0xff2a2e3d),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 33,
                            width: 36,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: model['category']=='Food'?Icon(
                              Icons.restaurant,
                              color: Color(0xffff6d6e),
                            ):model['category']=='WorkOut'?Icon(
                              Icons.fitness_center,
                              color: Color(0xfff29732),
                            ):model['category']=='Work'?Icon(
                              Icons.work,
                              color: Color(0xff6557ff),
                            ): model['category']=='Design'?Icon(
                              Icons.draw,
                              color: Color(0xff234ebd),
                            ): model['category']=='Run'?Icon(
                              Icons.directions_run,
                              color: Color(0xff2bc8d9),
                            ):Icon(Icons.book)
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              " ${model['title']}",
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            "${model['time']}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            )),
      );

  Widget todoBuilder({
    required List<Map> tasks,
  }) =>
      ConditionalBuilder(
        condition: tasks.isNotEmpty,
        builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
           todoItem(tasks[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: tasks.length,
        ),
        fallback: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Icons.menu,
                size: 100.0,
                color: Colors.grey,
              ),
              const Text(
                'No Tasks Yet Please Add Some Tasks',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
  Widget myDivider() => Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      );


}
class Select{
  String? id;
  bool? checkValue;
  Select({this.id,this.checkValue});
}
