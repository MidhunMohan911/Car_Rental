import 'package:dio/dio.dart';

class DioClient {
  static Dio dio = Dio(
    BaseOptions(baseUrl: "https://roadsterrental.online/api/user"),
  );
}
