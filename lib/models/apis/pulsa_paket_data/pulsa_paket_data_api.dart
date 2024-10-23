import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../utils/const/urls.dart';
import '../../pulsa_paket_data.dart';

class PulsaPaketDataApi {
  late String token;

  PulsaPaketDataApi(
    this.token,
  );

  Dio dioApi() {
    BaseOptions options = BaseOptions(
      baseUrl: Urls.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      responseType: ResponseType.json,
    );
    final dio = Dio(options);

    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        logPrint: (object) => debugPrint(object.toString())));
    return dio;
  }

  Future<PulsaPaketDataResponse> getPulsaPaketData(String phone) async {
    final result = await _getRequest(
      endpoint: Urls.pulsapaketdataList,
      params: {
        // 'type': 'paket_data',
        // 'provider': 'telkomsel',
        'phone_number': phone,
      },
    );
    // ignore: avoid_print
    print('result: $result');
    PulsaPaketDataResponse response =
        PulsaPaketDataResponse.fromJson(result.data!);

    return response;
  }

  Future<Response<Map<String, dynamic>>> _getRequest({
    required String endpoint,
    Map<String, dynamic>? params,
  }) async {
    Dio dio = dioApi();
    try {
      Response<Map<String, dynamic>> response =
          await dio.get(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print(e.response?.data);
      }
      rethrow;
    }
  }
}
