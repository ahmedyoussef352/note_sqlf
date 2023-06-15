// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/shared/cubit/cubit.dart';
import 'package:todo/shared/cubit/states.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
   XFile? image ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var profileImage1 = AppCubit.get(context).profileImage;
        var x = 1;
        return Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // Container(
                //   width: 100,
                //   height: 100,
                //   child: x ==null ? AssetImage('assets/user.png') : Container(child: Icon(icon),) 
                  
                
                 
                // //AssetImage(),
                // ),
                 CircleAvatar(radius: 60,
                // ignore: unnecessary_null_comparison
                backgroundImage: profileImage1 == null?
                 const AssetImage('assets/user.png')
                :
                 AssetImage(profileImage1.path),
                //FileImage(profileImage1)
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    button(),
                    IconButton(onPressed: ()async{
                      // image = await _picker.pickImage(
                      //   source: ImageSource.gallery
                      //   );
                      // setState(() {
                      //   image=image;
                      // });
                      AppCubit.get(context).getProfileImage();
                    },
                     // ignore: prefer_const_constructors
                     icon: Icon(Icons.add_a_photo,color: Colors.teal,
                     size: 30,))
    
                  ],
                )
              ],
            ),
          ),
        ),
      );
        
      },
      
    );
  }
  ImageProvider getImage(){
    if(image !=null)
    {
      return FileImage(File(image!.path));
    }
    return const AssetImage('assets/user.png');
  }


  Widget button(
    //Function onTap
    ) {
    return InkWell(
      onTap: () {
        // setState(() {
        //   onTap();
        // });
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 2 ,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // ignore: prefer_const_literals_to_create_immutables
            gradient: const LinearGradient(colors: [
              Color(0xff8a32f1),
              Color(0xffad32f9),
            ])),
        child: const Center(
          child: Text(
            'Upload',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}