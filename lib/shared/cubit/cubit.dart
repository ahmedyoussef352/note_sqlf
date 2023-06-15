// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/pages/addtodo.dart';
import 'package:todo/pages/profile.dart';
import 'package:todo/shared/cubit/states.dart';
import '../../modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import '../../modules/todo_app/done_tasks/done_tasks_screen.dart';
import '../../modules/todo_app/new_tasks/new_tasks_screen.dart';
import '../../network/local/cache_helper.dart';
import '../../pages/HomePage.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    HomePage(),
    AddTodo(),
    Profile(),
  ];
  void changeIndex(index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  //////////imagePacker

  late File profileImage;
  var picker = ImagePicker();

  Future <void> getProfileImage() async{
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedFile != null){
      profileImage = File(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
    }else{
      print('No image selected');
      emit(ProfileImagePickedErorrState());
    }
  }

  var database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() {
    openDatabase(
      'todo.ff',
      version: 3,
      onCreate: (database, version) {
        // id integer
        // title String
        // date String
        // time String
        // status String

        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, type TEXT, descreption TEXT, category TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String type,
    required String descreption,
    required String category,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO tasks(title, type, descreption, category) VALUES("$title", "$type","$descreption", "$category")',
      )
          .then((value) {
        print('$value inserted successfully');

        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  updateToDatabase({
    required String title,
    required String type,
    required String descreption,
    required String category,
    required int id,
  }) async {
    await database.transaction((txn) {
      txn.rawUpdate(
        ''' UPDATE tasks SET 
        title = "$title",
        type = "$type",
        descreption = "$descreption",
        category = "$category" 
        WHERE id = "$id"''',
      ).then((value) {
        print('$value updated successfully');

        emit(UpdateDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Updating New Record ${error.toString()}');
      });

      return null;
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        // if(element['status'] == 'new') {
        //   newTasks.add(element);
        // } else if(element['status'] == 'done') {
        //   doneTasks.add(element);
        // } else {
        //   archivedTasks.add(element);
        // }
        newTasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    required String status,
    required int id,
  }) async {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    required int id,
  }) async {
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  // void changeBottomSheetState({
  //   required bool isShow,
  //   required IconData icon,
  // }) {
  //   isBottomSheetShown = isShow;
  //   fabIcon = icon;

  //   emit(AppChangeBottomSheetState());
  // }
  // bool isDark = false;

  // void changeAppMode({ bool? fromShared})
  // {
  //   if(fromShared != null)
  //   {
  //     isDark = fromShared;
  //     emit(AppChangeModeState());
  //   }
  //   else {
  //        isDark = !isDark;
  //   CacheHelper.putBoolean(key: 'isDark',value: isDark).then((value)
  //   {
  //        emit(AppChangeModeState());
  //   });
  //}

  //}
}
