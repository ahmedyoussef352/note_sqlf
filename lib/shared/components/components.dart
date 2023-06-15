// ignore: import_of_legacy_library_into_null_safe

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  final Function()? onTap,
  bool isClickable = true,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isClickable,
  onTap: onTap,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    
    border: const OutlineInputBorder(),
  ),
);


Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Text(
                  '${model['time']}',
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model['title']}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model['date']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updateData(
                      status: 'done',
                      id: model['id'],
                    );
                  },
                  icon: const Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updateData(
                      status: 'archive',
                      id: model['id'],
                    );
                  },
                  icon: const Icon(
                    Icons.archive,
                    color: Colors.black45,
                  )),
            ],
          ),
          padding: const EdgeInsets.all(20.0)),
    );

Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

  // Widget textItem(
  //     String labeltext, TextEditingController controller, bool obscureText) {
  //   return Container(
  //     width: MediaQuery.of(context as BuildContext).size.width - 70,
  //     height: 55,
  //     child: TextFormField(
  //       controller: controller,
  //       obscureText: obscureText,
  //       style: TextStyle(
  //         fontSize: 17,
  //         color: Colors.white,
  //       ),
  //       decoration: InputDecoration(
  //         labelText: labeltext,
  //         labelStyle: TextStyle(
  //           fontSize: 17,
  //           color: Colors.white,
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: BorderSide(
  //             width: 1.5,
  //             color: Colors.amber,
  //           ),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: BorderSide(
  //             width: 1,
  //             color: Colors.grey,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // Widget buttonItem(
  //     String imagepath, String buttonName, double size, Function onTap) {
  //   return InkWell(
  //     onTap: (){
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context as BuildContext).size.width - 60,
  //       height: 60,
  //       child: Card(
  //         color: Colors.black,
  //         elevation: 8,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           side: BorderSide(
  //             width: 1,
  //             color: Colors.grey,
  //           ),
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SvgPicture.asset(
  //               imagepath,
  //               height: size,
  //               width: size,
  //             ),
  //             SizedBox(
  //               width: 15,
  //             ),
  //             Text(
  //               buttonName,
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 17,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  