import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkUtils {
  NetworkUtils._();

  static Dio client(
      {Duration? connectTimeout,
      Duration? receiveTimeout,
      Duration? sendTimeout,
      String? token}) {
    var dio = Dio(
      BaseOptions(
        headers: {
          // 'Host': 'ikepvx72dh.execute-api.ap-southeast-1.amazonaws.com',
          'Accept': 'application/json',
          "Authorization": "Bearer $token",
        },
        connectTimeout: connectTimeout ?? const Duration(seconds: 45),
        receiveTimeout: receiveTimeout ?? const Duration(seconds: 45),
        sendTimeout: sendTimeout,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    // print log
    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        logPrint: (object) => debugPrint(object.toString())));

    return dio;
  }
}
