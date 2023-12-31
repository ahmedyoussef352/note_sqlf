import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


// class DioHelper 
// {
//   static Dio? dio;

//   static intit()
//   {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://student.valuxapps.com/api/',
//         receiveDataWhenStatusError: true,
//         headers: {
//           'Content-Type':'application/json'
//         },
//       )
//     );
//   }
//   static Future<Response> getData({
//     required String url,
//     required  Map<String , dynamic> query,
//     String lang = 'ar',
//     String ?token,
//   }) async
   
//   {
//     return await dio!.get(url, queryParameters:query);
//   }

//   static Future<Response> postData({
//     required String url,
//       Map<String , dynamic>? query,
//     required  Map<String , dynamic> data,
//     String lang = 'ar',
//     String? token, 

//   }) async
//   {
//     dio!.options.headers = {
//         'lang':lang,
//         'Authorization': token,
//     };
//     return dio!.post(url,
//     queryParameters: query,
//     data: data,
//      );
//   }
  
// }

class DioHelper {
  static Dio? dio;

  static intit()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String ?token,
  }) async
  {
    dio?.options.headers =
    {
      'lang':lang,
      // 'Authorization': token??'',
    'Authorization' : '5Cnlvf4fkAkjOl0XNyE10hrD452OqlVyqnNJawHw2d11zJJuej8I6dZuHK97wqpipOjtNm',

      'Content-Type': 'application/json',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String ?token,
  }) async
  {
    dio?.options.headers =
    {
      'lang':lang,
      // 'Authorization': token??'',
      'Authorization' : '5Cnlvf4fkAkjOl0XNyE10hrD452OqlVyqnNJawHw2d11zJJuej8I6dZuHK97wqpipOjtNm',
      'Content-Type': 'application/json',
    };

    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}


  