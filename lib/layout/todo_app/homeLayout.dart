// ignore: file_names
// ignore_for_file: unrelated_type_equality_checks

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/cubit/states.dart';

import '../../shared/cubit/cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<AppCubit, AppStates>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       var cubit = AppCubit.get(context);
    //       Color a = const Color.fromARGB(219, 168, 168, 167);
    //       // ignore: prefer_const_constructors
    //       return Scaffold(

    //         // bottomNavigationBar: BottomNavigationBar(
    //         //   currentIndex: cubit.currentIndex,

    //         //   onTap: (index) {
    //         //     cubit.changeIndex(index);
    //         //   },
    //         //   backgroundColor: Colors.black87,
    //         //   // ignore: prefer_const_literals_to_create_immutables
    //         //   items: [
    //         //     BottomNavigationBarItem(
    //         //       label: ' ',
    //         //       icon: Icon(Icons.home,
    //         //           size: 30,
    //         //           color: cubit.currentIndex == 0
    //         //               ? Colors.purple
    //         //               : Colors.white),
    //         //     ),
    //         //     BottomNavigationBarItem(
    //         //       label: ' ',
    //         //       icon: Container(
    //         //         height: 55,
    //         //         width: 52,
    //         //         decoration: const BoxDecoration(
    //         //             shape: BoxShape.circle,
    //         //             // ignore: prefer_const_literals_to_create_immutables
    //         //             gradient: LinearGradient(colors: [
    //         //               Colors.indigoAccent,
    //         //               Colors.purple,
    //         //             ])),
    //         //         child: const Icon(
    //         //           Icons.add,
    //         //           size: 32,
    //         //           color: Colors.white,
    //         //         ),
    //         //       ),
    //         //     ),
    //         //     BottomNavigationBarItem(
    //         //         label: ' ',
    //         //         icon: Icon(Icons.settings,
    //         //             size: 32,
    //         //             color: cubit.currentIndex == 0
    //         //                 ? Colors.purple
    //         //                 : Colors.white),
    //         //         activeIcon: Container()),
    //         //   ],
    //         // ),
    //       );
    //     });
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          Color a = Color.fromARGB(219, 168, 168, 167);
          return Scaffold(
            bottomNavigationBar: 
            Container(
              padding: EdgeInsets.only(top: 4),
              color: Color(0xff252041),
              
              child: CurvedNavigationBar(
                backgroundColor: Color(0xff252041),
                 buttonBackgroundColor: Color.fromARGB(255, 197, 3, 232),
                color: Colors.black,
                index: cubit.currentIndex,
                animationCurve: Curves.ease,
                letIndexChange: (index) {
                  cubit.changeIndex(index);
                  return true;
                },
                items: <Widget>[
                  Icon(
                      Icons.home,
                      size: 32,
                      color:
                          cubit.changeIndex == 0 ? Colors.white : Colors.white),
                  Icon(
                      Icons.add,
                      size: 32,
                      color:
                          cubit.changeIndex == 1 ? Colors.white :   Colors.white,
                        ),
                         
                  Icon(
                      Icons.settings,
                      size: 32,
                      color:
                          cubit.changeIndex == 2 ? Colors.black : Colors.white),
                ],
                onTap: (index) {
                  cubit.changeIndex(index);
                  //Handle button tap
                },
              ),
            // ignore: dead_code
            
            // BottomNavigationBar(
            //   currentIndex: cubit.currentIndex,

            //   onTap: (index) {
            //     cubit.changeIndex(index);
            //   },
            //   backgroundColor: Colors.black87,
            //   // ignore: prefer_const_literals_to_create_immutables
            //   items: [
            //     BottomNavigationBarItem(
            //       label: ' ',
            //       icon: Icon(Icons.home,
            //           size: 30,
            //           color: cubit.currentIndex == 0
            //               ? Colors.purple
            //               : Colors.white),
            //     ),
            //     BottomNavigationBarItem(
            //       label: ' ',
            //       icon: Container(
            //         height: 55,
            //         width: 52,
            //         decoration: const BoxDecoration(
            //             shape: BoxShape.circle,
            //             // ignore: prefer_const_literals_to_create_immutables
            //             gradient: LinearGradient(colors: [
            //               Colors.indigoAccent,
            //               Colors.purple,
            //             ])),
            //         child: const Icon(
            //           Icons.add,
            //           size: 32,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //     BottomNavigationBarItem(
            //         label: ' ',
            //         icon: Icon(Icons.settings,
            //             size: 32,
            //             color: cubit.currentIndex == 3
            //                 ? Colors.red
            //                 : Colors.white),
            //         activeIcon: Container()),
            //   ],
             ),
            body: cubit.screens[cubit.currentIndex],
          );
        });
  }
}
