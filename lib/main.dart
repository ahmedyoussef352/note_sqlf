// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/pages/HomePage.dart';
import 'package:todo/pages/signup_page.dart';
import 'package:todo/pages/addtodo.dart';
import 'package:todo/shared/bloc_observer.dart';
import 'package:todo/shared/cubit/cubit.dart';
import 'package:todo/shared/cubit/states.dart';
import 'package:todo/shared/themes.dart';

import 'Service/Auth_Service.dart';
import 'firebase_options.dart';
import 'layout/todo_app/homeLayout.dart';
import 'layout/todo_app/todo_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthClass authClass = AuthClass();
  Widget currentPage = SignUpPage();

  @override
  void initState() {
    super.initState();
     authClass.signOut();
    checkLogin();
  }

  checkLogin() async {
    String? tokne = await authClass.getToken();
    // ignore: avoid_print
    print("tokne");
    if (tokne != null) {
      setState(() {
        currentPage = const HomeLayout();
      });
    }
    else{
      setState(() {
        currentPage = SignUpPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..createDatabase()
            
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
        },
      ),
    );
  }
}
