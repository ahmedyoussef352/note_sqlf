// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  var titleController = TextEditingController();
  // var time = TextEditingController();
  var descreptionsController = TextEditingController();
  String type = '';
  String category = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff1d1e26),
                  Color(0xff252041),
                ]),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              cubit.currentIndex = 0;
                            });
                          },
                          icon: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            'Create',
                            style: TextStyle(
                                fontSize: 33,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'New Todo',
                            style: TextStyle(
                              fontSize: 33,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),

                          SizedBox(
                            height: 25,
                          ),
                          label('Task Tittle'),
                          SizedBox(
                            height: 12,
                          ),
                          title(),
                          SizedBox(
                            height: 30,
                          ),
                          label('Task Type'),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              taskSelect('importatnt', 0xFF315AC1),
                              SizedBox(
                                width: 20,
                              ),
                              taskSelect('planned', 0xff2bc8d9),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          label('Descreption'),
                          SizedBox(
                            height: 12,
                          ),
                          descreption(),
                          SizedBox(
                            height: 25,
                          ),
                          label('Category'),
                          SizedBox(
                            height: 12,
                          ),
                          Wrap(
                            runSpacing: 10,
                            children: [
                              categorySelect('Food', 0xffff6d6e),
                              SizedBox(
                                width: 20,
                              ),
                              categorySelect('WorkOut', 0xfff29732),
                              SizedBox(
                                width: 20,
                              ),
                              categorySelect('Work', 0xff6557ff),
                              SizedBox(
                                width: 20,
                              ),
                              categorySelect('Design', 0xff234ebd),
                              SizedBox(
                                width: 20,
                              ),
                              categorySelect('Run', 0xff2bc8d9),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: (){
                              cubit.insertToDatabase(title: titleController.text, type: type, descreption: descreptionsController.text, category: category);
                              // Navigator.pop(context);
                            },
                            child: Container(
                              height: 56,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  gradient: LinearGradient(colors: [
                                    Color(0xff8a32f1),
                                    Color(0xffad32f9),
                                  ])),
                              child: Center(
                                child: Text(
                                  'Add Todo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  // Widget button(Function onTap) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         onTap();
  //       });
  //     },
  //     child: Container(
  //       height: 56,
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //           // ignore: prefer_const_literals_to_create_immutables
  //           gradient: LinearGradient(colors: [
  //             Color(0xff8a32f1),
  //             Color(0xffad32f9),
  //           ])),
  //       child: Center(
  //         child: Text(
  //           'Add Todo',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 18,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget taskSelect(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          type = label;
        });
      },
      child: Chip(
        backgroundColor: type == label ? Colors.white : Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(label),
        labelStyle: TextStyle(
            color: type == label ? Colors.black : Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600),
        labelPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
      ),
    );
  }

  Widget categorySelect(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          category = label;
        });
      },
      child: Chip(
        backgroundColor: category == label ? Colors.white : Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(label),
        labelStyle: TextStyle(
            color: category == label ? Colors.black : Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600),
        labelPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
      ),
    );
  }

  Widget title() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: titleController,
        style: TextStyle(color: Colors.grey, fontSize: 17),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Task Tittle',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
            contentPadding: EdgeInsets.only(
              left: 20,
              right: 20,
            )),
      ),
    );
  }

  Widget label(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16.5,
      ),
    );
  }

  Widget descreption() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: descreptionsController,
        style: TextStyle(color: Colors.grey, fontSize: 17),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Descreption',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
            contentPadding: EdgeInsets.only(
              left: 20,
              right: 20,
            )),
      ),
    );
  }
}
