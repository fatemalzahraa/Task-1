import 'package:dio/dio.dart';
import 'api_exception.dart';

ApiException handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return ApiException('Connection timed out. Please check your network.');

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      if (statusCode == 404) {
        return ApiException('Resource not found.', statusCode: statusCode);
      }
      return ApiException(
        'A server error occurred (${statusCode ?? "Unknown"}).',
        statusCode: statusCode,
      );

    case DioExceptionType.connectionError:
      return ApiException('No internet connection.');

    case DioExceptionType.cancel:
      return ApiException('Request was cancelled.');

    default:
      return ApiException('An unexpected error occurred. Please try again.');
  }
}