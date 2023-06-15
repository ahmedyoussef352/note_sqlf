// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

// import 'package:flutter/material.dart';

// class TodoCard extends StatefulWidget {
//    TodoCard(
//       {super.key,
//       this.title,
//       this.iconData,
//       this.iconColor,
//       this.time,
//     this.check,
//       this.iconBgcolor});
//   final String? title;
//   final IconData? iconData;
//   final Color? iconColor;
//   final Color? iconBgcolor;
//   final String? time;
//   bool? check;

//   @override
//   State<TodoCard> createState() => _TodoCardState();
// }

// class _TodoCardState extends State<TodoCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Row(
//         children: [
//           Theme(
//             // ignore: sort_child_properties_last
//             child: Transform.scale(
//               scale: 1.5,
//               child: Checkbox(
//                 shape: BeveledRectangleBorder(
//                     borderRadius: BorderRadius.circular(5)),
//                 activeColor: Color.fromARGB(255, 2, 119, 254),
//                 checkColor: Color(0xff0e3e26),
//                 onChanged: (bool? value) {
//                   setState(() {
//                     widget.check==true?widget.check=false:widget.check=true;
//                   });
//                 },
//                 value: widget.check,
//               ),
//             ),
//             data: ThemeData(
//                 primaryColor: Colors.blue,
//                 unselectedWidgetColor: Color(0xff5e616a)),
//           ),
//           Expanded(
//               child: Container(
//             height: 75,
//             child: Card(
//               color: Color(0xff2a2e3d),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Container(
//                     height: 33,
//                     width: 36,
//                     decoration: BoxDecoration(
//                         color: widget.iconBgcolor,
//                         borderRadius: BorderRadius.circular(8)),
//                     child: Icon(
//                       widget.iconData,
//                       color: widget.iconColor,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: Text(
//                       widget.title.toString(),
//                       style: TextStyle(
//                         fontSize: 18,
//                         letterSpacing: 1,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     widget.time.toString(),
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                 ],
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
