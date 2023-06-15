// // ignore_for_file: import_of_legacy_library_into_null_safe, duplicate_ignore, must_be_immutable


// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:todo/Service/Auth_Service.dart';
// import 'package:todo/pages/signIn_page.dart';

// import '../../shared/components/components.dart';
// import '../../shared/cubit/cubit.dart';
// import '../../shared/cubit/states.dart';

// // ignore: import_of_legacy_library_into_null_safe


// class HomeLayout extends StatelessWidget 
//  {
//   var scaffoldKey = GlobalKey<ScaffoldState>();
  
//   var titleController = TextEditingController();
//    var timeController = TextEditingController();
//    var dateController = TextEditingController();
   

//   HomeLayout({super.key});
   

 

//   @override
//   Widget build(BuildContext context) {
//     AuthClass authClass = AuthClass();
//     return BlocProvider(
//       create: (BuildContext context) => AppCubit()..createDatabase(),
//       child: BlocConsumer<AppCubit, AppStates>(
//         listener: (BuildContext context, AppStates state) {
//           if(state is AppInsertDatabaseState)
//           {
//             Navigator.pop(context);
//           }
//         },
//         builder: (BuildContext context, AppStates state){
//           AppCubit cubit = AppCubit.get(context);
//           return Scaffold(
//           key: scaffoldKey,
//           appBar: AppBar(
//             actions: [
//           IconButton(
//               icon: const Icon(Icons.logout),
//               onPressed: () async {
//                 await authClass.signOut();
//                 // ignore: use_build_context_synchronously
//                 Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(builder: (builder) => SignInPage()),
//                     (route) => false);
//               }),
//         ],
//             title: Text(
//             cubit.titles[cubit.currentIndex]
//             ),
//           ),
//           body:ConditionalBuilder(
//             condition: state is! AppGetDatabaseLoadingState,
//             builder: (context) => cubit.screens[cubit.currentIndex],
//             fallback: (context) => const Center(child: CircularProgressIndicator()),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: ()
//             {
//               if(cubit.isBottomSheetShown)
//               {
//                 cubit.insertToDatabase(title: titleController.text,
//                  time: timeController.text,
//                  date: dateController.text);
//               } else
//                 {
//                   scaffoldKey.currentState?.showBottomSheet(
//                   (context) =>
//                    Container(
//                     color: Colors.white,
//                     padding: const EdgeInsets.all(20.0,),
//                     child:
//                        Column(
//                     mainAxisSize: MainAxisSize.min,
//                   children:
//                    [
//                       defaultFormField(
//                         controller: titleController,
//                         type: TextInputType.text,
//                         validate: (String value)
//                         {
//                           if(value.isEmpty)
//                           {
//                             return 'title must not be empty';
//                           }
//                           return null;
//                         },
//                         label: 'Task title',
//                         prefix: Icons.title,
//                         ),
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         defaultFormField(
//                         controller: timeController,
//                         type: TextInputType.datetime,
//                         onTap: (){
//                           showTimePicker
//                           (context: context,
//                            initialTime: TimeOfDay.now(),
//                           ).then((value)
//                            {
//                              timeController.text= value!.format(context).toString();
//                              print(value.format(context));
//                           });
                          
//                         },
//                         validate: (String value)
//                         {
//                           if(value.isEmpty)
//                           {
//                             return 'time must not be empty';
//                           }
//                           return null;
//                         },
//                         label: 'Task time',
//                         prefix: Icons.watch_later_outlined,
//                         ),

                        
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         defaultFormField(
//                         controller: dateController,
//                         type: TextInputType.datetime,
//                         onTap: (){
//                         showDatePicker(context: context,
//                          initialDate: DateTime.now(),
//                           firstDate:  DateTime.now(),
//                            lastDate:  DateTime.parse('2022-11-01')
//                         ).then((value)
//                         {
//                           dateController.text = DateFormat.yMMMd().format(value!);
//                         });
//                         },
//                         validate: (String value)
//                         {
//                           if(value.isEmpty)
//                           {
//                             return 'date must not be empty';
//                           }
//                           return null;
//                         },
//                         label: 'Task Date',
//                         prefix: Icons.calendar_today,
//                         ),
                           

//                    ],
//                   ),

//                      ),
                   
//                    elevation: 20.0,
//                   ).closed.then((value)
//                   {

//                  cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
//                   });
//                   cubit.changeBottomSheetState(isShow: true, icon: Icons.add); 
//                 }
              
//             },
//             child: Icon(
//               cubit.fabIcon,
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: cubit.currentIndex,
//             onTap: (index) {
//               cubit.changeIndex(index);
//             },
//             items: [
//               const BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.menu,
//                 ),
//                 label: 'Tasks',
//               ),
//               const BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.check_circle_outline,
//                 ),
//                 label: 'Done',
//               ),
//               const BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.archive_outlined,
//                 ),
//                 label: 'Archived',
//               ),
//             ],
//           ),
//         );
//         },
         
//       ),
//     );
//   }

//   Future<String> getName() async {
//     return ('Ahmed Ali');
//   }

//  }

// // 1. create database
// // 2. create tables
// // 3. open database
// // 4. insert to database
// // 5. get from database
// // 6. update in database
// // 7. delete from database
