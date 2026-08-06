import 'package:dio/dio.dart';
import 'package:task_1/core/error/error_handler.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<T> get<T>(String path, T Function(dynamic json) parser) async {
    try {
      final response = await dio.get(path);
      return parser(response.data);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<T> post<T>(
    String path,
    dynamic data,
    T Function(dynamic json) parser,
  ) async {
    try {
      final response = await dio.post(path, data: data);
      return parser(response.data);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<T> put<T>(
    String path,
    dynamic data,
    T Function(dynamic json) parser,
  ) async {
    try {
      final response = await dio.put(path, data: data);
      return parser(response.data);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<void> delete(String path) async {
    try {
      await dio.delete(path);
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}


